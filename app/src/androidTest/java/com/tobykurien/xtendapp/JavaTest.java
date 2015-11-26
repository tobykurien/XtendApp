package com.tobykurien.xtendapp;

import android.app.Activity;
import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;
import android.test.suitebuilder.annotation.LargeTest;

import com.tobykurien.xtendapp.activity.MainActivity;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import static android.support.test.espresso.Espresso.*;
import static android.support.test.espresso.action.ViewActions.*;
import static android.support.test.espresso.matcher.ViewMatchers.*;

/**
 * Created by toby on 2015/11/26.
 */
@RunWith(AndroidJUnit4.class)
@LargeTest
public class JavaTest {
    @Rule
    public ActivityTestRule aRule = new ActivityTestRule<>(MainActivity.class);

    @Test
    public void testMe() {
        Activity activity = aRule.getActivity();
        onView(withText(activity.getString(R.string.welcome))).perform(click());
    }
}
