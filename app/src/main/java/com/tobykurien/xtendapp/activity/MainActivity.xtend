package com.tobykurien.xtendapp.activity

import android.support.v7.app.AppCompatActivity
import android.content.res.Configuration
import android.view.MenuItem

import org.xtendroid.app.AndroidActivity
import org.xtendroid.app.OnCreate

import com.tobykurien.xtendapp.utils.MyActionBarDrawerToggle
import com.tobykurien.xtendapp.fragment.FragmentOne
import com.tobykurien.xtendapp.fragment.FragmentTwo
import com.tobykurien.xtendapp.fragment.FragmentWelcome

import com.tobykurien.xtendapp.R

import static extension org.xtendroid.utils.AsyncBuilder.*
import static extension com.tobykurien.xtendapp.utils.Dependencies.*

// Main activity
@AndroidActivity(R.layout.activity_main) class MainActivity extends AppCompatActivity {
    MyActionBarDrawerToggle actionBarDrawerToggle

    @OnCreate
    def void init() {
        setupToolbar()
        setupDrawerLayout()
        drawer.setNavigationItemSelectedListener = [item|
            onOptionsItemSelected(item)
        ]

        addFragment(-1)
    }

    def addFragment(int position) {
        // create a new fragment each time. Change this to cache fragments as necessary.
        var frag = switch (position) {
            case 0: new FragmentOne()
            case 1: new FragmentTwo()
            default: new FragmentWelcome()
        }

        supportFragmentManager
            .beginTransaction
            .replace(R.id.container, frag, String.valueOf(position))
            .commit();
    }

    def setupDrawerLayout() {
        actionBarDrawerToggle = new MyActionBarDrawerToggle(this, drawerLayout, toolbar)
        drawerLayout.drawerListener = actionBarDrawerToggle

        // This following line actually reveals the hamburger
        drawerLayout.post [
            actionBarDrawerToggle.syncState()
        ];

        // open the drawer on first launch to show user that it exists
        if(!settings.drawerLearned) {
            async [builder, params|
                // wait for UI to be displayed before opening drawer,
                // so that user can see the animation and know where the
                // drawer comes from
                Thread.sleep(2_000)
                return null
            ].then [
                // open the drawer. When user closes drawer, settings.drawerLearned will be updated
                drawerLayout.openDrawer(drawer)
            ].start()
        }
    }

    def setupToolbar() {
        setSupportActionBar(toolbar)
        val actionBar = supportActionBar
        actionBar.displayHomeAsUpEnabled = false
    }

    // Handle drawer item selections
    override onOptionsItemSelected(MenuItem item) {
        switch (item.itemId) {
            case R.id.navigation_item_1: addFragment(0)
            case R.id.navigation_item_2: addFragment(1)
            default: return super.onOptionsItemSelected(item)
        }

        drawerLayout.closeDrawer(drawer)
        return true
    }

    override onBackPressed() {
        if(drawerLayout.isDrawerOpen(drawer)) {
            drawerLayout.closeDrawer(drawer)
        } else {
            super.onBackPressed()
        }
    }

    /**
     * Invariant to changes in orientation
     */
    override onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        actionBarDrawerToggle.onConfigurationChanged(newConfig);
    }
}
