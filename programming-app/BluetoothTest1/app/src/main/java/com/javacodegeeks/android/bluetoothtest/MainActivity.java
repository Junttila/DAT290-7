package com.javacodegeeks.android.bluetoothtest;

import android.bluetooth.BluetoothSocket;
import android.os.Bundle;
import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;

import java.io.OutputStream;
import java.util.Set;
import java.util.UUID;

import android.content.Intent;
import android.content.IntentFilter;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {

    private static final int REQUEST_ENABLE_BT = 1;
    private Button onBtn;
    private Button offBtn;
    private Button listBtn;
    private Button findBtn;
    private Button send0Btn;
    private Button send00111111Btn;
    private OutputStream OutStream;
    private BluetoothAdapter myBluetoothAdapter;
    private BluetoothSocket socket;
    private BluetoothDevice btDevice;
    private TextView text;
    private Set<BluetoothDevice> pairedDevices;
    private ListView myListView;
    private ArrayAdapter<String> BTArrayAdapter;
  
   @Override
   protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_main);
      
      // take an instance of BluetoothAdapter - Bluetooth radio
      myBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
      if(myBluetoothAdapter == null) {
    	  onBtn.setEnabled(false);
    	  offBtn.setEnabled(false);
    	  listBtn.setEnabled(false);
    	  findBtn.setEnabled(false);
    	  text.setText("Status: not supported");
    	  
    	  Toast.makeText(getApplicationContext(),"Your device does not support Bluetooth",
         		 Toast.LENGTH_LONG).show();
      } else {
	      text = (TextView) findViewById(R.id.text);
	      onBtn = (Button)findViewById(R.id.turnOn);
	      onBtn.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				on(v);
			}
	      });
	      
	      offBtn = (Button)findViewById(R.id.turnOff);
	      offBtn.setOnClickListener(new OnClickListener() {
	  		
	  		@Override
	  		public void onClick(View v) {
	  			// TODO Auto-generated method stub
	  			off(v);
	  		}
	      });
	      
	      listBtn = (Button)findViewById(R.id.paired);
	      listBtn.setOnClickListener(new OnClickListener() {
	  		
	  		@Override
	  		public void onClick(View v) {
	  			// TODO Auto-generated method stub
	  			list(v);
	  		}
	      });
	      
	      findBtn = (Button)findViewById(R.id.search);
	      findBtn.setOnClickListener(new OnClickListener() {
	  		
	  		@Override
	  		public void onClick(View v) {
	  			// TODO Auto-generated method stub
	  			find(v);
	  		}
	      });

          send0Btn = (Button)findViewById(R.id.Send0);
          send0Btn.setOnClickListener(new OnClickListener() {

              @Override
              public void onClick(View v) {
                  // TODO Auto-generated method stub
                  send0(v);
              }
          });

		  send00111111Btn = (Button)findViewById(R.id.Send00111111);
		  send00111111Btn.setOnClickListener(new OnClickListener() {

			  @Override
			  public void onClick(View v) {
				  // TODO Auto-generated method stub
				  send00111111(v);
			  }
		  });

	      myListView = (ListView)findViewById(R.id.listView1);
	
	      // create the arrayAdapter that contains the BTDevices, and set it to the ListView
	      BTArrayAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1);
	      myListView.setAdapter(BTArrayAdapter);
      }
   }

   public void on(View view){
      if (!myBluetoothAdapter.isEnabled()) {
         Intent turnOnIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
         startActivityForResult(turnOnIntent, REQUEST_ENABLE_BT);

         Toast.makeText(getApplicationContext(),"Bluetooth turned on" ,
        		 Toast.LENGTH_LONG).show();
      }
      else{
         Toast.makeText(getApplicationContext(),"Bluetooth is already on",
        		 Toast.LENGTH_LONG).show();
      }
   }
   
   @Override
   protected void onActivityResult(int requestCode, int resultCode, Intent data) {
	   // TODO Auto-generated method stub
	   if(requestCode == REQUEST_ENABLE_BT){
		   if(myBluetoothAdapter.isEnabled()) {
			   text.setText("Status: Enabled");
		   } else {   
			   text.setText("Status: Disabled");
		   }
	   }
   }
   
   public void list(View view){
	  // get paired devices
      pairedDevices = myBluetoothAdapter.getBondedDevices();
      
      // put it's one to the adapter
      for(BluetoothDevice device : pairedDevices)
    	  BTArrayAdapter.add(device.getName()+ "\n" + device.getAddress());

      Toast.makeText(getApplicationContext(),"Show Paired Devices",
    		  Toast.LENGTH_SHORT).show();
      
   }
   
   final BroadcastReceiver bReceiver = new BroadcastReceiver() {
	    public void onReceive(Context context, Intent intent) {
	        String action = intent.getAction();
	        // When discovery finds a device
	        if (BluetoothDevice.ACTION_FOUND.equals(action)) {
	             // Get the BluetoothDevice object from the Intent
	        	 BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
	        	 // add the name and the MAC address of the object to the arrayAdapter
	             BTArrayAdapter.add(device.getName() + "\n" + device.getAddress());
	             BTArrayAdapter.notifyDataSetChanged();
	        }
	    }
	};
	
   public void find(View view) {
	   if (myBluetoothAdapter.isDiscovering()) {
		   // the button is pressed when it discovers, so cancel the discovery
		   myBluetoothAdapter.cancelDiscovery();
	   }
	   else {
			BTArrayAdapter.clear();
			myBluetoothAdapter.startDiscovery();
			
			registerReceiver(bReceiver, new IntentFilter(BluetoothDevice.ACTION_FOUND));	
		}    
   }
   
   public void off(View view){
	  myBluetoothAdapter.disable();
	  text.setText("Status: Disconnected");
	  
      Toast.makeText(getApplicationContext(),"Bluetooth turned off",
    		  Toast.LENGTH_LONG).show();
   }
    public void send0(View view) {

        if (myBluetoothAdapter.isEnabled()) {
            Intent sendIntent = new Intent();
            sendIntent.setAction(Intent.ACTION_SEND);
            sendIntent.putExtra("send0bytes",0);
        }
    }
	public void send00111111(View view) {
        // Hittade följande genom att söka på android bluetooth serial
        for (BluetoothDevice d : myBluetoothAdapter.getBondedDevices())
        {
            if (d.getName() == "HC-05")
            {
                btDevice = d;
            }
        }

        UUID uuid = UUID.fromString(btDevice.getUuids()[0].toString());
        try {
            socket = btDevice.createRfcommSocketToServiceRecord(uuid);
            OutStream = socket.getOutputStream(); // here socket is the bluetooth socket you establish

            int x = 0;
            while (x <= 10) {
                x++;
                if (myBluetoothAdapter.isEnabled()) {
                    Intent sendIntent = new Intent();
                    sendIntent.setAction(Intent.ACTION_SEND);
                    sendIntent.putExtra("send00111111bytes", 0x3F);
                    String message="this is test data";
                    byte[] send = message.getBytes();
                    OutStream.write(send);//this is what sends the message
                }
            }
            Toast.makeText(getApplicationContext(),"00111111 "+ Integer.toString(x),
                    Toast.LENGTH_SHORT).show();

        } catch (Exception ex) {}
	}
   
   @Override
   protected void onDestroy() {
	   // TODO Auto-generated method stub
	   super.onDestroy();
	   unregisterReceiver(bReceiver);
   }
		
}
