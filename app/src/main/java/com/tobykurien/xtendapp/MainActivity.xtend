package com.tobykurien.xtendapp

import android.support.v7.app.ActionBarActivity

import org.xtendroid.app.AndroidActivity
import org.xtendroid.app.OnCreate
import static extension org.xtendroid.utils.AlertUtils.*

@AndroidActivity(R.layout.activity_main) class MainActivity extends ActionBarActivity {

   @OnCreate
   def init() {
      message.text = "Hello, Xtend!"
   }

}