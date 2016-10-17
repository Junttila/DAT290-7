package com.javacodegeeks.android.bluetoothtest;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.Toast;

import com.daimajia.easing.BaseEasingMethod;
import com.daimajia.easing.Glider;
import com.daimajia.easing.Skill;
import com.nineoldandroids.animation.AnimatorSet;

import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.util.UUID;

import butterknife.ButterKnife;
import butterknife.InjectView;

public class SeekBarActivity extends Activity {

    @InjectView(R.id.volume_bar)
    SeekBar volumeControl;
    @InjectView(R.id.snap_bar)
    SeekBar snapBarControl;

    private static final int SNAP_MIN = 0;
    private static final int SNAP_MIDDLE = 31;
    private static final int SNAP_MAX = 63;

    private static final int LOWER_HALF = (SNAP_MIN + SNAP_MIDDLE) / 2;
    private static final int UPPER_HALF = (SNAP_MIDDLE + SNAP_MAX) / 2;

    private BluetoothAdapter myBluetoothAdapter;
    private BluetoothSocket socket;
    private BluetoothDevice btDevice;
    private OutputStream outStream;
    private static final int REQUEST_ENABLE_BT = 1;

    private Button go;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_seekbar);

        ButterKnife.inject(this);

        setVolumeControlListener();
        setSnapBarControl();

        myBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        Intent turnOnIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
        startActivityForResult(turnOnIntent, REQUEST_ENABLE_BT);
        for (BluetoothDevice d : myBluetoothAdapter.getBondedDevices()) {
            if (d.getAddress() == "00:15:83:35:82:E6" || d.getName() == "HC-05" || true)
                btDevice = d;
        }
        try {
        UUID uuid = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
        socket = btDevice.createRfcommSocketToServiceRecord(uuid);
        Toast.makeText(getApplicationContext(),btDevice.getName(),
                Toast.LENGTH_SHORT).show();

            socket.connect();
            outStream = socket.getOutputStream();
        }
        catch (Exception ex) {
            Toast.makeText(getApplicationContext(),ex.getMessage(),
                    Toast.LENGTH_SHORT).show();
        }
        go = (Button)findViewById(R.id.go);
        go.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                go(v);
            }
        });
    }

    private void setVolumeControlListener() {
        volumeControl.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
            int progressChanged = 0;
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                progressChanged = progress;
               /* Toast.makeText(getApplicationContext(), progress,
                        Toast.LENGTH_SHORT).show();*/
                byte[] bytes = {(byte)(progress | 64)};



                try {
                    outStream.write(bytes);

                } catch (Exception ex) {
                    Toast.makeText(getApplicationContext(), ex.getMessage(),
                            Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }



            @Override
            public void onStopTrackingTouch(final SeekBar seekBar) {

                final int duration = 750;
                int progress = seekBar.getProgress();
                setProgressAnimated(seekBar, progress, SNAP_MIDDLE, Skill.ElasticEaseOut, duration);

                byte[] bytes = {(byte)31 | 64};
                try {
                    outStream.write(bytes);
                }
                catch (Exception e) {

                }
            }
        });
    }


    private void setSnapBarControl() {
        snapBarControl.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
            int progressChanged = 0;
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                progressChanged = progress;
               /* Toast.makeText(getApplicationContext(), progress,
                        Toast.LENGTH_SHORT).show();*/
                byte[] bytes = {(byte)(progress | 127)};
                Toast.makeText(getApplicationContext(), Byte.toString(bytes[0]),
                        Toast.LENGTH_SHORT).show();


                try {
                    outStream.write(bytes);

                } catch (Exception ex) {
                    Toast.makeText(getApplicationContext(), ex.getMessage(),
                            Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(final SeekBar seekBar) {

                final int duration = 750;
                int progress = seekBar.getProgress();
                setProgressAnimated(seekBar, progress, SNAP_MIDDLE, Skill.ElasticEaseOut, duration);

                byte[] bytes = {(byte)31 | 127};
                try {
                    outStream.write(bytes);
                }
                catch (Exception e) {

                }
            }
        });
    }

    private static void setProgressAnimated(final SeekBar seekBar, int from, int to, Skill skill, final int duration) {
        final AnimatorSet set = new AnimatorSet();
        set.playTogether(Glider.glide(skill, duration, com.nineoldandroids.animation.ValueAnimator.ofInt().ofFloat(from, to), new BaseEasingMethod.EasingListener() {
            @Override
            public void on(float t, float result, float v2, float v3, float v4) {
                seekBar.setProgress((int) result);
            }
        }));
        set.setDuration(duration);
        set.start();
    }

    private static void setProgressAnimatedJdk(final SeekBar seekBar, int from, int to) {
        ValueAnimator anim = ValueAnimator.ofInt(from, to);
        anim.setDuration(100);
        anim.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            @Override
            public void onAnimationUpdate(ValueAnimator animation) {
                int animProgress = (Integer) animation.getAnimatedValue();
                seekBar.setProgress(animProgress);
            }
        });
        anim.start();
    }
    public void go(View v) {
        byte[] bytes = {(byte)192};
        try {
            outStream.write(bytes);
        }
        catch (Exception e) {

        }
    }
}
