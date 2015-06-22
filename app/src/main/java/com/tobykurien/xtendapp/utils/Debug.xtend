package com.tobykurien.xtendapp.utils

import com.tobykurien.xtendapp.BuildConfig

/**
 * Global debug switches for testing and debugging
 */
class Debug {
    public val static boolean ON = BuildConfig.DEBUG // global on/off switch. Turn off for production

    public val static boolean NET = ON && true // demo of creating a switch for testing
    public val static boolean API = ON && true // demo of creating a switch for testing
}