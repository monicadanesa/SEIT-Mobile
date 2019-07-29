import subprocess
import re
from robot.api import logger
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
from robot.libraries.String import String
from mykonos.keywords.element import *
from mykonos.locator.locator_element import *
from mykonos.keywords.touch import *

gc = GetConditions()
gl = GlobalElement()
le = LocatorElement()
cl = Click()
tc = Touch()
wc = ExpectedConditions()

@keyword('Retrieve items to list')
def retrieve_items_to_list(className):
    """ own keywords for retrieve items and put into list."""
    j = 0
    list = []
    while True:
        list.append(gc.get_element_attribute(className=className, element='childCount'))
        Touch().scroll(max_swipes=j)
        j = j + 1
        if j > 5 :
            break

    return sum(list)

def get_actual_width_device():
    cmd = 'adb shell wm size'
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out, err = p.communicate()
    byte_decode = out.decode().replace('\n', '')
    actual_size = byte_decode[15:len(byte_decode)]
    actual_x = actual_size[0:(actual_size).find("x")]

    return int(actual_x)

def get_list():
    lists = []
    total_loop = gc.get_element_attribute(className='androidx.recyclerview.widget.RecyclerView', element='childCount')

    for i in range(0,total_loop):
        parent = le.get_locator(className='androidx.recyclerview.widget.RecyclerView')
        child = le.get_child(parent=parent,className='android.view.ViewGroup', index=i)
        address=le.get_child(parent=child, index=1)
        lists.append(address.info['text'])

    return lists

def show_data_match_with():
    lists = get_list()
    for i, list in enumerate(lists):
        parent = le.get_locator(className='androidx.recyclerview.widget.RecyclerView')
        child = le.get_child(parent=parent,className='android.view.ViewGroup', index=i)
        grand_child=le.get_child(parent=child,index=3)

        if re.search("^Deliver documents.*Andrio$", list) or re.search("^Deliver parcel.*Leviero$", list):
            logger.info(list)
            logger.info(grand_child.info['text'])
