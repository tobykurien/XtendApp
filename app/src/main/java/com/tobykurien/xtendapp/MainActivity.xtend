package com.tobykurien.xtendapp

import android.support.v7.app.ActionBarActivity
import android.support.v4.app.Fragment
import android.content.res.Configuration
import android.widget.ArrayAdapter

import org.xtendroid.app.AndroidActivity
import org.xtendroid.annotations.AndroidFragment
import org.xtendroid.app.OnCreate

//import static extension org.xtendroid.utils.AlertUtils.*
import static extension com.tobykurien.xtendapp.Settings.*


@AndroidFragment(R.layout.fragment_one) class FragmentOne extends Fragment
{

}

@AndroidFragment(R.layout.fragment_two) class FragmentTwo extends Fragment
{

}


@AndroidActivity(R.layout.activity_main_blacktoolbar) class MainActivity extends ActionBarActivity {

   @OnCreate
   def init() {
       setupToolbar()
       setupDrawerLayout()
   }

   MyActionBarDrawerToggle actionBarDrawerToggle

   def addFragment(int position)
   {
        val tx = supportFragmentManager.beginTransaction
        var Fragment frag =
        if (position == 0)
            new FragmentOne() as Fragment
        else
            new FragmentTwo() as Fragment
        tx.replace(R.id.container, frag).addToBackStack(null).commit();
   }

   def setupDrawerLayout()
   {
       val listView = drawerListView

       val String[] arrayOfWords = #["Hello", "Xtend"]
       listView.adapter = new ArrayAdapter<String>(this, R.layout.drawer_list_item, arrayOfWords)
       listView.onItemClickListener = [parent, view, position, id| addFragment(position) ];

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

