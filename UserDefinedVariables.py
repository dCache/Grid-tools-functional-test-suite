import os

PROTOCOL_PORTS = {"srm": os.environ.get('SRM_PORT'), "gsidcap": os.environ.get('GSIDCAP_PORT'), "gsiftp": os.environ.get('GSIFTP_PORT'), "http": os.environ.get('HTTP_PORT'), "dcap": os.environ.get('DCAP_PORT')}

HOST = os.environ.get('DFTS_SUT')

LOCAL_DIR = os.environ.get('WORKSPACE')
LOCAL_FILE = LOCAL_DIR + "/localfile"

REMOTE_DIR = os.environ.get('REMOTE_DIR')
REMOTE_FILE = "remotefile"
if REMOTE_DIR:
    REMOTE_FILE = REMOTE_DIR + "remotefile"
