package com.example.logonaf.exemplojson;

import android.support.v7.app.ActionBarActivity;
import android.app.ListActivity;
import android.app.ProgressDialog;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;


public class JsonActivity extends ListActivity {
    private Context context;
    private static String url = "http://docs.blackberry.com/sampledata.json";
    private static final String type = "vehicleType";
    private static final String color = "vehicleColor";
    private static final String fuel = "fuel";
    ArrayList<HashMap<String, String>> jsonlist = new ArrayList<HashMap<String, String>>();
    ListView lv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_json);
        new ProgressTask(JsonActivity.this).execute();
    }

    private class ProgressTask extends AsyncTask<String, Void, Boolean> {
        private ProgressDialog dialog;

        public ProgressTask(ListActivity activity) {
            Log.i("1", "Called");
            context = activity;
            dialog = new ProgressDialog(context);
        }

        private Context context;

        protected void onPreExecute() {
            this.dialog.setMessage("Processo em andamento");
            this.dialog.show();
        }

        @Override
        protected void onPostExecute(final Boolean success) {
            if (dialog.isShowing()) {
                dialog.dismiss();
            }
            ListAdapter adapter = new SimpleAdapter(context, jsonlist, R.layout.list_activity, new String[]{type, color, fuel}, new int[]{R.id.vehicleType, R.id.vehicleColor, R.id.fuel});
            setListAdapter(adapter);
            lv = getListView();
        }

        protected Boolean doInBackground(final String... args) {
            JSONParser jParser = new JSONParser();
            JSONArray json = jParser.getJSONFromUrl(url);
            for (int i = 0; i < json.length(); i++) {
                try {
                    JSONObject c = json.getJSONObject(i);
                    String vtype = c.getString(type);
                    String vcolor = c.getString(color);
                    String vfuel = c.getString(fuel);
                    HashMap<String, String> map = new HashMap<String, String>();
                    map.put(type, vtype);
                    map.put(color, vcolor);
                    map.put(fuel, vfuel);
                    jsonlist.add(map);
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
            return null;
        }
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_json, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
