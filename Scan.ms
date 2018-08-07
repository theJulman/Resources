/*max file import
max file import
for obj in $* do
(
	select obj
	macros.run "RappaTools2" "CenterPivot"
	obj.pos = [0,0,0]
	obj.scale = [4.41527,4.41527,4.41527]
	macros.run "Modifier Stack" "Convert_to_Poly"
)
$*[1].name = "OBJECT_HIGH"
$*[2].name = "OBJECT_LOW"
select $APPLE_HIGH
--modPanel.addModToSelection (Projection ()) ui:on*/
global HighPolyObject
global LowPolyObject

global modProject

try(destroyDialog test)catch()
Rollout test "Process Scan" height:300
(
	Button bHigh "High Poly" width:100
	Button bLow "Low Poly" width:100
	Button bStart "Start" enabled:false width:100
	Button bReset "New" width:100
	
	on bHigh pressed do
	(
		max file import
		bHigh.Text = "Imported"
		bHigh.Enabled = false
		HighPolyObject = $
		macros.run "RappaTools2" "CenterPivot"
		HighPolyObject.pos = [0,0,0]
		HighPolyObject.scale = [4.41527,4.41527,4.41527]
		macros.run "Modifier Stack" "Convert_to_Poly"
		HighPolyObject.name = "Object_High"
		if $Object_Low!=undefined then
			bStart.Enabled = true
		max zoomext sel
	)
	
	on bLow pressed do
	(
		max file import
		bLow.Text = "Imported"
		bLow.Enabled = false
		LowPolyObject = $
		macros.run "RappaTools2" "CenterPivot"
		LowPolyObject.pos = [0,0,0]
		LowPolyObject.scale = [4.41527,4.41527,4.41527]
		macros.run "Modifier Stack" "Convert_to_Poly"
		LowPolyObject.name = "Object_Low"
		if $Object_High!=undefined then
			bStart.Enabled = true
		max zoomext sel
	)
	
	on bStart pressed do
	(
		modProject = Projection()
		addModifier HighPolyObject modProject
		modPanel.setCurrentObject modProject
		modProject.addObjectNode LowPolyObject
		modProject.addRegisteredProjectionType 1
		modProject.projectAll()
		delete HighPolyObject
		select LowPolyObject
		macros.run "Modifier Stack" "Convert_to_Poly"
		max file export selected
	)
	
	on bReset pressed do
	(
		resetMaxFile #noprompt
		destroyDialog test
		createDialog test
	)
)
createDialog test