// Fill out your copyright notice in the Description page of Project Settings.

#include "Sock.h"
#include "Networking.h"
#include "TimerManager.h"
#include <string>

// Sets default values
ASock::ASock()
{
 	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
	mesh = CreateDefaultSubobject<UStaticMeshComponent>("BigNigga");

}

// Called when the game starts or when spawned
void ASock::BeginPlay()
{
	Super::BeginPlay();

	if (!StartTCPReceiver("RamaSocketListener", "192.168.178.45", 8423))
	{
		UE_LOG(LogTemp, Warning, TEXT("TCP Socket Listener Failed!"));
		return;
	}
	
}

void ASock::EndPlay(const EEndPlayReason::Type EndPlayReason)
{
	UE_LOG(LogTemp, Warning, TEXT("EndPlay Called"));
	//ConnectionSocket->Close();
	ListenerSocket->Close();
}

// Called every frame
void ASock::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

//Rama's Start TCP Receiver
bool ASock::StartTCPReceiver(
	const FString& YourChosenSocketName,
	const FString& TheIP,
	const int32 ThePort
)
{
	//Rama's CreateTCPConnectionListener
	ListenerSocket = CreateTCPConnectionListener(YourChosenSocketName, TheIP, ThePort);

	//Not created?
	if (!ListenerSocket)
	{
		UE_LOG(LogTemp, Error, TEXT("StartTCPReceiver>> Listen socket could not be created! ~> %s %d"), *TheIP, ThePort);
		return false;
	}
	UE_LOG(LogTemp, Warning, TEXT("StartTCPReceiver>> Listen socket created! ~> %s %d"), *TheIP, ThePort);

	//TODO: Start the Listener! //thread this eventually
	GetWorldTimerManager().SetTimer(ConnectionListenTimer, this, &ASock::TCPConnectionListener, 0.01f, true);

	return true;
}
//Format IP String as Number Parts
bool ASock::FormatIP4ToNumber(const FString& TheIP, uint8(&Out)[4])
{
	//IP Formatting
	TheIP.Replace(TEXT(" "), TEXT(""));
	const TCHAR *delim;
	delim = TEXT(".");

	TArray<FString> Parts;
	TheIP.ParseIntoArray(Parts, delim, true);
	if (Parts.Num() != 4)
		return false;

	for (int32 i = 0; i < 4; ++i)
	{
		Out[i] = FCString::Atoi(*Parts[i]);
	}
	return true;
}
//Rama's Create TCP Connection Listener
FSocket* ASock::CreateTCPConnectionListener(const FString& YourChosenSocketName, const FString& TheIP, const int32 ThePort, const int32 ReceiveBufferSize)
{
	uint8 IP4Nums[4];
	if (!FormatIP4ToNumber(TheIP, IP4Nums))
	{
		UE_LOG(LogTemp, Error, TEXT("Invalid IP! Expecting 4 parts separated by ."));
		return false;
	}
	//Create Socket
	FIPv4Endpoint Endpoint(FIPv4Address(IP4Nums[0], IP4Nums[1], IP4Nums[2], IP4Nums[3]), ThePort);
	FSocket* ListenSocket = FTcpSocketBuilder(*YourChosenSocketName)
		.AsReusable()
		.BoundToEndpoint(Endpoint)
		.Listening(8);
	//Set Buffer Size
	int32 NewSize = 0;
	ListenSocket->SetReceiveBufferSize(ReceiveBufferSize, NewSize);
	//Done!
	return ListenSocket;
}
//Rama's TCP Connection Listener
void ASock::TCPConnectionListener()
{
	//~~~~~~~~~~~~~
	//UE_LOG(LogTemp, Warning, TEXT("Checking socket..."));
	if (!ListenerSocket)
	{
		UE_LOG(LogTemp, Error, TEXT("Listener doesn't exist, but should."));
		return;
	}

	//Remote address
	TSharedRef<FInternetAddr> RemoteAddress = ISocketSubsystem::Get(PLATFORM_SOCKETSUBSYSTEM)->CreateInternetAddr();
	bool Pending;

	// handle incoming connections
	if (ListenerSocket->HasPendingConnection(Pending)&&Pending)
	{
		UE_LOG(LogTemp, Warning, TEXT("Connection Pending..."));
		//Already have a Connection? destroy previous
		if (ConnectionSocket)
		{
			ConnectionSocket->Close();
			ISocketSubsystem::Get(PLATFORM_SOCKETSUBSYSTEM)->DestroySocket(ConnectionSocket);
		}
		//New Connection receive!
		ConnectionSocket = ListenerSocket->Accept(*RemoteAddress, TEXT("TODO: Start Kick off Event"));

		if (ConnectionSocket != NULL)
		{
			//Global cache of current Remote Address
			RemoteAddressForConnection = FIPv4Endpoint(RemoteAddress);

			UE_LOG(LogTemp, Warning, TEXT("Accepted Connection!"));
			//can thread this too
			GetWorldTimerManager().SetTimer(SocketListenTimer, this, &ASock::TCPSocketListener, 0.01f, true);
		}
	}
}

FString ASock::StringFromBinaryArray(const TArray<uint8>& BinaryArray)
{
	//Create a string from a byte array!
	std::string cstr(reinterpret_cast<const char*>(BinaryArray.GetData()), BinaryArray.Num());
	return FString(cstr.c_str());
}

//Rama's TCP Socket Listener
void ASock::TCPSocketListener()
{
	//~~~~~~~~~~~~~
	if (!ConnectionSocket) return;

	//Binary Array!
	TArray<uint8> ReceivedData;
	uint32 Size;
	while (ConnectionSocket->HasPendingData(Size))
	{
		ReceivedData.Init(0.0f, FMath::Min(Size, 65507u));

		int32 Read = 0;
		ConnectionSocket->Recv(ReceivedData.GetData(), ReceivedData.Num(), Read);

		UE_LOG(LogTemp, Warning, TEXT("Data Read! %d"), ReceivedData.Num());
	}
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	if (ReceivedData.Num() <= 0)
	{
		//No Data Received
		return;
	}
	const FString ReceivedUE4String = StringFromBinaryArray(ReceivedData);
	//Logging
	UE_LOG(LogTemp, Warning, TEXT("Total Data read! %d"), ReceivedData.Num());
	UE_LOG(LogTemp, Warning, TEXT("As String!!!!! ~> %s"), *ReceivedUE4String);
	ASock::Avatar(ReceivedUE4String);
}