package com.tobykurien.xtendapp.utils

import android.support.v7.app.ActionBarDrawerToggle
import android.support.v7.widget.Toolbar
import android.support.v4.widget.DrawerLayout
import android.app.Activity
import android.view.View
import android.content.Context

import static extension org.xtendroid.utils.AlertUtils.*
import static extension com.tobykurien.xtendapp.utils.Dependencies.*

class MyActionBarDrawerToggle extends ActionBarDrawerToggle {
   Context mContext
   Activity mActivity
   (View)=>void onClosed = null

   public new(Activity activity, DrawerLayout drawerLayout, Toolbar toolbar) {
      super(activity, drawerLayout, toolbar, 0, 0)
      mContext = activity as Context
      mActivity = activity
   }

   override onDrawerClosed(View view) {
      super.onDrawerClosed(view)
      mActivity.invalidateOptionsMenu()
      if (onClosed != null) {
         onClosed.apply(view)
         onClosed = null
      }
   }

   /**
    * Write to preferences after the drawer has been opened for the first time,
    * e.g. use-case: [ShowCaseView](https://github.com/amlcurran/ShowcaseView)
    */
   override onDrawerOpened(View view) {
      super.onDrawerOpened(view)
      mContext.settings.drawerLearned = true
   }
   
   /**
    * Set a function to run next time the drawer is closed
    */
   def public void setOnClosed((View)=>void onClosed) {
      this.onClosed = onClosed
   }
}