package com.tobykurien.xtendapp

import android.support.test.runner.AndroidJUnit4
import android.test.suitebuilder.annotation.LargeTest
import com.tobykurien.xtendapp.activity.MainActivity
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import android.support.test.rule.ActivityTestRule
import static android.support.test.espresso.Espresso.*
import static android.support.test.espresso.action.ViewActions.*
import static android.support.test.espresso.matcher.ViewMatchers.*
import android.test.ActivityInstrumentationTestCase2

/**
 * Created by toby on 2015/11/26.
 */
@RunWith(AndroidJUnit4)
@LargeTest
class BasicUiTest {

    @Rule
    var public aRule = new ActivityTestRule(MainActivity)

    @Test
    def public void testMe() {
        onView(withId(R.id.navigation_item_1))
            .perform(click())
    }
}