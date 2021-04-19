# Copyright (C) 2009 The Android Open Source Project
# Copyright (C) 2019 The Mokee Open Source Project
# Copyright (C) 2019 The LineageOS Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import common
import re

def FullOTA_InstallEnd(info):
  OTA_InstallVendor(info)
  OTA_InstallEnd(info)
  return

def IncrementalOTA_InstallEnd(info):
  OTA_InstallVendor(info)
  OTA_InstallEnd(info)
  return

def AddImage(info, basename, dest):
  name = basename
  data = info.input_zip.read("IMAGES/" + basename)
  common.ZipWriteStr(info.output_zip, name, data)
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))

def AddImageRadio(info, basename, dest):
  name = basename
  data = info.input_zip.read("RADIO/" + basename)
  common.ZipWriteStr(info.output_zip, name, data)
  if dest: # Do we want to install the file or just add it to the zip?
    info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))

def OTA_InstallVendor(info):
  # Magic fuckery begins here
  info.script.Print("Patching vendor image unconditionally...") # Deception
  AddImageRadio(info, "vendor_op_list", "") # Add the dynamic operations list file to the zip
  AddImageRadio(info, "vendor.img", "") # Add the vendor image to the zip
  info.script.AppendExtra('# hello there') # egg
  info.script.AppendExtra('assert(update_dynamic_partitions(package_extract_file("vendor_op_list")));') # resize vendor lp
  info.script.AppendExtra('package_extract_file("vendor.img", map_partition("vendor"));') # yup, it's that simple

def OTA_InstallEnd(info):
  info.script.Print("Patching dtbo and vbmeta images...")
  AddImage(info, "dtbo.img", "/dev/block/bootdevice/by-name/dtbo")
  AddImage(info, "vbmeta.img", "/dev/block/bootdevice/by-name/vbmeta")
  return
