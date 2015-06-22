package com.tobykurien.xtendapp.utils

import android.content.Context

/**
 * Alternative to dependency injection for singletons - simply define
 * getters here which can be used in the code as a keyword once this class
 * is imported as a static extension.
 *
 * To facilitate testing, use the Debug.XXX constants to change the singleton
 * returned, for example:
 *   if (Debug.MOCK_API) return MockApi.getInstance()  else return JsonApi.getInstance();
 */
class Dependencies {

    // Return an instance of the Settings class for accessing shared preferences
    def public static getSettings(Context context) {
        Settings.getSettings(context)
    }

}