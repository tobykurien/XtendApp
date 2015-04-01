package com.tobykurien.xtendapp

import android.support.v7.app.ActionBarActivity
import android.support.v7.app.ActionBarDrawerToggle
import android.support.v7.widget.Toolbar
import android.support.v4.widget.DrawerLayout
import android.content.res.Configuration
import android.widget.ArrayAdapter
import android.app.Activity
import android.view.View

import org.xtendroid.app.AndroidActivity
import org.xtendroid.app.OnCreate
//import static extension org.xtendroid.utils.AlertUtils.*


@AndroidActivity(R.layout.activity_main) class MainActivity extends ActionBarActivity {
   MyActionBarDrawerToggle actionBarDrawerToggle

   @OnCreate
   def init() {
       setupToolbar()
       setupDrawerLayout()
   }

   def setupDrawerLayout() {
       val String[] arrayOfWords = #["Hello", "Xtend"]
       drawerListView.adapter = new ArrayAdapter<String>(this, R.layout.drawer_list_item, arrayOfWords)
       drawerListView.onItemClickListener = [parent, view, position, id|
         /* TODO do something, e.g. put a fragment in the container */
       ];

       actionBarDrawerToggle = new MyActionBarDrawerToggle(this, drawerLayout, toolbar)

       // This following line actually reveals the hamburger
       drawerLayout.post [
         actionBarDrawerToggle.syncState()
       ];

       drawerLayout.drawerListener = actionBarDrawerToggle
   }

   def setupToolbar() {
        setSupportActionBar(toolbar)
        val actionBar = supportActionBar
        actionBar.displayHomeAsUpEnabled = true
   }

   override onBackPressed() {
       val listView = drawerListView
       if (drawerLayout.isDrawerOpen(listView))
           drawerLayout.closeDrawer(listView)
       else
           super.onBackPressed()
   }

   /**
    * Invariant to changes in orientation
    */
   override onConfigurationChanged(Configuration newConfig) {
       super.onConfigurationChanged(newConfig);
       actionBarDrawerToggle.onConfigurationChanged(newConfig);
   }

}

/**
 *
 * TODO
 * - write to preferences after the drawer has been opened for the first time,
 *   e.g. use-case: [ShowCaseView](https://github.com/amlcurran/ShowcaseView)
 */
class MyActionBarDrawerToggle extends ActionBarDrawerToggle
{
    public new(Activity context, DrawerLayout drawerLayout, Toolbar toolbar)
    {
        super(context, drawerLayout, toolbar, 0, 0)
    }

    override onDrawerClosed(View view)
    {
        super.onDrawerClosed(view)
    }

    override onDrawerOpened(View view)
    {
        super.onDrawerOpened(view)
    }
}


