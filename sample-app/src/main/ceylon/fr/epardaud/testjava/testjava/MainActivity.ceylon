import android.os { Bundle }
import android.support.design.widget { FloatingActionButton, Snackbar }
import android.support.v7.app { AppCompatActivity }
import android.support.v7.widget { Toolbar }
import android.view { View { OnClickListener }, Menu, MenuItem }
import android.content { Intent }
import dalvik.system { DexFile }
import ceylon.interop.java { javaString, javaClass }
import java.lang { CharSequence }

shared class MainActivity() extends AppCompatActivity() {

    shared actual void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.\Ilayout.activity_main);
        assert(is Toolbar toolbar = findViewById(R.\Iid.toolbar));
        setSupportActionBar(toolbar);

        assert(is FloatingActionButton fab = findViewById(R.\Iid.fab));
        fab.setOnClickListener(object satisfies OnClickListener {
            shared actual void onClick(View view) {
//                Snackbar.make(view, javaString("Hello from Ceylon: "+`MainActivity`.string), Snackbar.\iLENGTH_LONG)
//                        .setAction(javaString("Action"), null).show();
		Intent intent = Intent(outer, javaClass<Main2Activity>());
                startActivity(intent);
            }
        });
    }

    shared actual Boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        menuInflater.inflate(R.\Imenu.menu_main, menu);
        return true;
    }

    shared actual Boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        Integer id = item.itemId;

        //noinspection SimplifiableIfStatement
        if (id == R.\Iid.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}