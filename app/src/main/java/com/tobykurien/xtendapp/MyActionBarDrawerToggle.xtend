package com.tobykurien.xtendapp

import android.support.v7.app.ActionBarDrawerToggle
import android.support.v7.widget.Toolbar
import android.support.v4.widget.DrawerLayout
import android.app.Activity
import android.view.View
import android.content.Context

//import static extension org.xtendroid.utils.AlertUtils.*
import static extension com.tobykurien.xtendapp.Settings.*

class MyActionBarDrawerToggle extends ActionBarDrawerToggle
{
    Context mContext
    Activity mActivity

    public new(Activity activity, DrawerLayout drawerLayout, Toolbar toolbar)
    {
        super(activity, drawerLayout, toolbar, 0, 0)
        mContext = activity as Context
        mActivity = activity
    }

    override onDrawerClosed(View view)
    {
        super.onDrawerClosed(view)
        mActivity.invalidateOptionsMenu()
    }

    /**
     * Write to preferences after the drawer has been opened for the first time,
     * e.g. use-case: [ShowCaseView](https://github.com/amlcurran/ShowcaseView)
    */
    override onDrawerOpened(View view)
    {
        super.onDrawerOpened(view)
        mContext.getSettings().drawerLearned = true
    }
}