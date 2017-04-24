package com.saldabi.quadris;

import android.app.Activity;
import android.content.res.AssetManager;
import android.util.Log;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.GestureDetector;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class GameActivity extends Activity {

    private static native void assetmanager(AssetManager manager);
    private static native void touch(int x,int y);
    private static native void close();
    private static native boolean back();
    private static native void swipe(int d);


    private AssetManager m_assetManager;
    private GestureDetector m_detector;

    private class DownloadFilesTask extends AsyncTask<String,Integer,Boolean> {
        protected void onProgressUpdate(Integer... pgr) {

        }

        @Override
        protected Boolean doInBackground(String... params) {

            try {
                ProcessBuilder pb;
                pb = new ProcessBuilder();
                pb.command(getFilesDir().getParent() + "/lib/gdbserver", "tcp:5039", "--attach", "" + android.os.Process.myPid())
                       .redirectErrorStream(true);
                Process p = pb.start();
                InputStream str = p.getInputStream();
                InputStreamReader rd = new InputStreamReader(str);
                BufferedReader reader = new BufferedReader(rd);
                while(true)
                {
                    try {
                        p.exitValue();
                        break;
                    }
                    catch(IllegalThreadStateException e)
                    {

                    }

                    Log.i("GDBSERVER",reader.readLine());
                }
            } catch (IOException e) {
                int a = 0;
            }
            return true;
        }

        protected void onPostExecute(Boolean res) {

        }
    }

    private class MyGestureListener extends GestureDetector.SimpleOnGestureListener {

        @Override
        public boolean onFling(MotionEvent event1, MotionEvent event2,
                               float velocityX, float velocityY) {

            int it = GameSurface.Renderer.GetWidth();
            float x1  = event1.getX();
            float x2 = event2.getX();

            if (Math.abs(x2-x1) > (float)it*.25f )
            {
                if (velocityX > 0.0f)
                    swipe(1);
                else
                    swipe(0);
            }


            return true;
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //new DownloadFilesTask().execute();

        System.loadLibrary("game");
        m_assetManager = getResources().getAssets();
        assetmanager(m_assetManager);



        GameSurface view = new GameSurface(getApplication());
        setContentView(view);

        m_detector = new GestureDetector(this,new MyGestureListener());
    }

    @Override
    protected void onPause()
    {
        super.onPause();

    }

    @Override
    public boolean onTouchEvent(MotionEvent ev)
    {
        int action = ev.getAction();
        if (action == MotionEvent.ACTION_DOWN)
        {
            touch((int)ev.getX(),(int)ev.getY());
        }

        m_detector.onTouchEvent(ev);
        return super.onTouchEvent(ev);
    }

    @Override
    public void onBackPressed()
    {
        if (!back())
            super.onBackPressed();
    }


}
