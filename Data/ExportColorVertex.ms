obj = selection[1]

getNumCPVVerts obj

fn write2d file =
(
	f=fopen file "wb"

	writeshort f 0x4153 --SA Magin
	writeshort f 0x1001 --Type RGB XY
	writelong f obj.numverts 

	for i=1 to obj.numverts do
	(
		local v=getvert obj i
		local c=getvertcolor obj i
		writebyte f c.r
		writebyte f c.g
		writebyte f c.b
		writebyte f 255
		writefloat f v.x
		writefloat f v.z
		
	)
	writelong f obj.numfaces 
	for i=1 to obj.numfaces do
	(
		local fc = getface obj i
		writeshort f ((fc.x)-1)
		writeshort f ((fc.y)-1)
		writeshort f ((fc.z)-1)
	)

	fclose f
)


utility Export2D ".2d Mesh Exporter"
(
	group "Export"
	(
		button bexport "     Export    "
	)
	
	on bexport pressed do
	( 
		xfilename=getsavefilename caption:"Save .x" \
			filename:xlastfile \
			types:"2D files (*.2d)|*.2d|All Files (*.*)|*.*|"
		if xfilename!=undefined do 
		(				
			writex xfilename
		)
	)

)
write2d "C:/Quadris/Quadris/roundedrect.2d"
write2d "C:/Quadris/Android/app/src/main/assets/roundedrect.2d"