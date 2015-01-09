package com.tobykurien.xtendapp

import android.support.v7.app.ActionBarActivity
import android.support.v7.app.ActionBarDrawerToggle
import android.support.v7.widget.Toolbar
import android.support.v4.widget.DrawerLayout
import android.widget.ArrayAdapter
import android.app.Activity
import android.view.View

import org.xtendroid.app.AndroidActivity
import org.xtendroid.app.OnCreate
//import static extension org.xtendroid.utils.AlertUtils.*

@AndroidActivity(R.layout.activity_main) class MainActivity extends ActionBarActivity {

   @OnCreate
   def init() {
       setupToolbar()
       setupDrawerLayout()
   }

   def setupDrawerLayout()
   {
       val String[] arrayOfWords = #["Hello", "Xtend"]
       drawerListView.adapter = new ArrayAdapter<String>(this, R.layout.drawer_list_item, arrayOfWords)
       drawerListView.onItemClickListener = [parent, view, position, id| /* do something */ ];

       drawerLayout.drawerListener = new MyActionBarDrawerToggle(this, drawerLayout, toolbar)
   }

   def setupToolbar()
   {
        supportActionBar = toolbar
        val actionBar = supportActionBar
        actionBar.displayHomeAsUpEnabled = true
        //actionBar.homeAsUpIndicator = R.drawable.ic_drawer // TODO do animated burger
   }

   override setTitle(CharSequence title)
   {
       super.setTitle(title)
       actionBar.title = title
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


