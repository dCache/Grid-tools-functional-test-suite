*** Settings ***

Variables	UserDefinedVariables.py
Resource	UserKeywords.robot

Library		String
Library		OperatingSystem
Library		DoorTesterLib.py	${HOST}
Library		ProtocolTesterLib.py
Library		FileTesterLib.py


Suite Setup	TEST PROTOCOL DOOR	${PROTOCOL}	${PORT}
Suite Teardown	REMOVE LOCAL AND REMOTE FILES WITH NAMES CONTAINING	localfile	remotefile

*** Variables ***

${PROTOCOL}	gsiftp
${PORT}		${PROTOCOL_PORTS}[${PROTOCOL}]
${CLIENT}	gfal-copy


*** Test Cases ***
NO DCAU
	[Documentation]		Tries copying a file without data channel authentication using gsiftp.
	SET CLIENT	${CLIENT}
	SET PROTOCOL	${PROTOCOL}	${PORT}
	SET HOST	${HOST}
	${FILE_NAME}=	REPLACE STRING	${TEST NAME}	${SPACE}	${EMPTY}
	CREATE FILE	${LOCAL_FILE}${FILE_NAME}	This is a testfile for ${TEST NAME}
	COPY LOCAL FILE	${LOCAL_FILE}${FILE_NAME}	${REMOTE_FILE}${FILE_NAME}
	COMMAND SHOULD EXECUTE SUCCESSFULLY

MULTIPLE PARALLEL STREAMS
	[Documentation]		Tries to copy a file using 10 parallel data streams using gsiftp
	SET CLIENT	${CLIENT}
	SET PROTOCOL	${PROTOCOL}	${PORT}
	SET HOST	${HOST}
	SET EXTRA ARGUMENTS	-n 10
	${FILE_NAME}=	REPLACE STRING	${TEST NAME}	${SPACE}	${EMPTY}
	CREATE FILE	${LOCAL_FILE}${FILE_NAME}	This is a testfile for ${TEST NAME}
	COPY LOCAL FILE	${LOCAL_FILE}${FILE_NAME}	${REMOTE_FILE}${FILE_NAME}
	COMMAND SHOULD EXECUTE SUCCESSFULLY

