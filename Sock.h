#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "Networking.h"
#include "Sock.generated.h"

UCLASS()
class TCP_API ASock : public AActor
{
	GENERATED_BODY()
	
public:	

	ASock();

protected:

	virtual void BeginPlay() override;
	virtual void EndPlay(const EEndPlayReason::Type EndPlayReason) override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	UPROPERTY(EditAnywhere)
	UStaticMeshComponent* mesh;

	FSocket* ListenerSocket;
	FSocket* ConnectionSocket;
	FIPv4Endpoint RemoteAddressForConnection;

	bool StartTCPReceiver(
		const FString& YourChosenSocketName,
		const FString& TheIP,
		const int32 ThePort
	);

	FSocket* CreateTCPConnectionListener(
		const FString& YourChosenSocketName,
		const FString& TheIP,
		const int32 ThePort,
		const int32 ReceiveBufferSize = 2 * 1024 * 1024
	);

	//Timer functions, could be threads
	void TCPConnectionListener(); 	//can thread this eventually
	void TCPSocketListener();		//can thread this eventually


									//Format String IP4 to number array
	bool FormatIP4ToNumber(const FString& TheIP, uint8(&Out)[4]);


	FString StringFromBinaryArray(const TArray<uint8>& BinaryArray);

	FTimerHandle ConnectionListenTimer;
	FTimerHandle SocketListenTimer;

	UFUNCTION(BlueprintImplementableEvent, Category = "REKT")
	void Avatar(const FString& RektString);
	
};
