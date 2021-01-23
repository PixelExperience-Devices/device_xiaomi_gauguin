/*
 * Copyright (C) 2019 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <android-base/logging.h>
#include <android-base/properties.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "property_service.h"
#include "vendor_init.h"

using android::init::property_set;

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}
void load_gauguin() {
    property_override("ro.product.model", "M2007J17G");
    property_override("ro.build.product", "gauguin");
    property_override("ro.product.device", "gauguin");
    property_override("ro.product.marketname", "Mi 10T Lite");
    property_override("ro.build.description", "gauguin-user 10 10/QKQ1.200628.002 V12.0.5.0.QJSMIXM release-keys");
    property_override("ro.build.fingerprint", "Redmi/gauguin/gauguin:10/QKQ1.200628.002/V12.0.5.0.QJSMIXM:user/release-keys");
}

void load_gauguininpro() {
    property_override("ro.product.model", "M2007J17I");
    property_override("ro.build.product", "gauguininpro");
    property_override("ro.product.device", "gauguininpro");
    property_override("ro.product.marketname", "Mi 10i");
    property_override("ro.build.description", "gauguininpro-user 10 QKQ1.200628.002 V12.0.4.0.QJSINXM release-keys");
    property_override("ro.build.fingerprint", "Xiaomi/gauguininpro/gauguininpro:10/QKQ1.200628.002/V12.0.4.0.QJSINXM:user/release-keys");
}

void load_gauguinpro() {
    property_override("ro.product.model", "M2007J17C");
    property_override("ro.build.product", "gauguinpro");
    property_override("ro.product.device", "gauguinpro");
    property_override("ro.product.marketname", "Redmi Note 9 Pro");
    property_override("ro.build.description", "gauguinpro-user 10 QKQ1.200628.002 V12.0.4.0.QJSCNXM release-keys");
    property_override("ro.build.fingerprint", "Redmi/gauguinpro/gauguinpro:10/QKQ1.200628.002/V12.0.4.0.QJSCNXM:user/release-keys");
}


void vendor_load_properties() {
    std::string region = android::base::GetProperty("ro.boot.hwc", "");

    if (region.find("CN") != std::string::npos) {
        load_gauguinpro();
    } else if (region.find("INDIA") != std::string::npos) {
        load_gauguininpro();
    } else if (region.find("GLOBAL") != std::string::npos) {
        load_gauguin();
    } else {
        LOG(ERROR) << __func__ << ": unexcepted region!";
    }
}
