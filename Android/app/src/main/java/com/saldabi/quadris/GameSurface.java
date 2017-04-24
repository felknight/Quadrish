package com.saldabi.quadris;

import android.content.Context;
import android.graphics.PixelFormat;
import android.opengl.GLSurfaceView;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;

import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.opengles.GL10;


public class GameSurface extends GLSurfaceView
{
    public GameSurface(Context context)
    {
        super(context);
        setRenderer(new Renderer());
        s_context = context;
    }

    private static native void loop();
    private static native void android_main(int w,int h);
    private static native void surface_changed(int w,int h);
    private static native void surface_lost();
    private static native void save_data(String s);

    private static Context s_context;

    public static class Renderer implements GLSurfaceView.Renderer
    {
        private static int s_Width;
        private static int s_Height;
        private static boolean s_Initiated = false;
        private static boolean s_Created = false;

        public void onDrawFrame(GL10 gl) {
            loop();
        }

        public void onSurfaceChanged(GL10 gl, int width, int height) {
            s_Width = width;
            s_Height = height;
            if (!s_Initiated)
            {
                android_main(s_Width, s_Height);
                save_data( s_context.getFilesDir().getAbsolutePath() );

                s_Initiated = true;
            }
            else if (s_Created) {
                surface_changed(s_Width, s_Height);
                surface_lost();
                s_Created = false;
            }
        }

        public void onSurfaceCreated(GL10 gl, EGLConfig config) {
            s_Created = true;
        }

        public static int GetWidth()
        {
            return s_Width;
        }

        public static int GetHeight()
        {
            return s_Height;
        }
    }
}

