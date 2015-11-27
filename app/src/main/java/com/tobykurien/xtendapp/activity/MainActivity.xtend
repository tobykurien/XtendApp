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

import static extension org.xtendroid.utils.AlertUtils.*
import static extension org.xtendroid.utils.AsyncBuilder.*
import static extension com.tobykurien.xtendapp.utils.Dependencies.*
import android.support.v4.app.FragmentStatePagerAdapter

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

        pager.setAdapter(fragments)

        // disable swiping of viewpager since we don't have a tablayout
        pager.onTouchListener = [ true ]

        showFragment(0)
    }

    // load the specified fragment
    def showFragment(int position) {
        pager.setCurrentItem(position)
    }

    def void setupDrawerLayout() {
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
            case R.id.navigation_item_1: showFragment(1)
            case R.id.navigation_item_2: showFragment(2)
            default: return super.onOptionsItemSelected(item)
        }

        drawerLayout.closeDrawer(drawer)
        return true
    }

    override onBackPressed() {
        if(drawerLayout.isDrawerOpen(drawer)) {
            drawerLayout.closeDrawer(drawer)
        } else if (supportFragmentManager.getBackStackEntryCount == 0) {
            confirm(getString(R.string.confirm_exit)) [
                finish()
            ]
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

    /**
     * Use a pager adapter to manage our fragment lifecycle and save/restore state
     */
    FragmentStatePagerAdapter fragments = new FragmentStatePagerAdapter(supportFragmentManager) {
        override getCount() {
            3
        }

        override getItem(int position) {
            switch (position) {
                case 0: new FragmentWelcome()
                case 1: new FragmentOne()
                case 2: new FragmentTwo()
                default: new FragmentWelcome()
            }
        }
    }
}
