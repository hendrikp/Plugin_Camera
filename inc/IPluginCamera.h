/* Camera_Plugin - for licensing and copyright see license.txt */

#include <IPluginBase.h>

#pragma once

/**
* @brief Camera Plugin Namespace
*/
namespace CameraPlugin
{
    /**
    * @brief plugin Camera concrete interface
    */
    struct IPluginCamera
    {
        /**
        * @brief Get Plugin base interface
        */
        virtual PluginManager::IPluginBase* GetBase() = 0;

        // TODO: Add your concrete interface declaration here
    };
};