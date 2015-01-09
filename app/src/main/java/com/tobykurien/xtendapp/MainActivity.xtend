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

/**
 *
 * TODO
 * - write to preferences after the drawer has been opened for the first time,
 *   e.g. use-case: [ShowCaseView](https://github.com/amlcurran/ShowcaseView)
 */
@AndroidActivity(R.layout.activity_main_blacktoolbar) class MainActivity extends ActionBarActivity {

   @OnCreate
   def init() {
       setupToolbar()
       setupDrawerLayout()
   }

   MyActionBarDrawerToggle actionBarDrawerToggle

   def setupDrawerLayout()
   {
       val listView = drawerListView

       val String[] arrayOfWords = #["Hello", "Xtend"]
       listView.adapter = new ArrayAdapter<String>(this, R.layout.drawer_list_item, arrayOfWords)
       listView.onItemClickListener = [parent, view, position, id| /* do something */ ];

       val drawer = drawerLayout

       actionBarDrawerToggle = new MyActionBarDrawerToggle(this, drawer, toolbar)

       // This following line actually reveals the hamburger
       drawer.post([|actionBarDrawerToggle.syncState()]);

       drawer.drawerListener = actionBarDrawerToggle
   }

   def setupToolbar()
   {
        supportActionBar = toolbar
        val actionBar = supportActionBar
        actionBar.displayHomeAsUpEnabled = true
   }

   /*
   override setTitle(CharSequence title)
   {
       super.setTitle(title)
       actionBar.title = title
   }*/

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


