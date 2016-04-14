package com.tobykurien.xtendapp

import android.support.test.rule.ActivityTestRule
import org.junit.Rule
import org.junit.Test
import com.tobykurien.xtendapp.activity.MainActivity
import static android.support.test.espresso.Espresso.*
import static android.support.test.espresso.action.ViewActions.*
import static android.support.test.espresso.matcher.ViewMatchers.*

class BasicUiTest {
    @Rule
    var public aRule = new ActivityTestRule(MainActivity)

    @Test
    def public void testMe() {
        onView(withText(aRule.activity.getString(R.string.welcome)))
            .perform(click());
    }
}
