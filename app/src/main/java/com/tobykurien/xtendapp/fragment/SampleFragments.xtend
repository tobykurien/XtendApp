package com.tobykurien.xtendapp.fragment

import android.os.Bundle
import android.support.v4.app.Fragment
import com.tobykurien.xtendapp.R
import org.xtendroid.annotations.AndroidFragment
import org.xtendroid.app.OnCreate

import static extension org.xtendroid.utils.AlertUtils.*

// Welcome fragment
@AndroidFragment(R.layout.fragment_welcome) class FragmentWelcome extends Fragment {
}

// Sample fragment 1
@AndroidFragment(R.layout.fragment_one) class FragmentOne extends Fragment {
    @OnCreate
    def init() {
        textView.text = "Fragment One"
        editText.hint = "Fragment one text input"
        button.onClickListener = [
            toast("Fragment One button clicked")
        ]
    }
}

// Sample fragment 2
@AndroidFragment(R.layout.fragment_two) class FragmentTwo extends Fragment {
    @OnCreate
    def init(Bundle state) {
        textView.text = "Fragment Two"
        editText.hint = "Fragment two text input"
        button.onClickListener = [
            toast("Fragment Two button clicked")
        ]
    }
}
