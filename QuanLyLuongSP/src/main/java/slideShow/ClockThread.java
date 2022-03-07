/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package slideShow;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JLabel;

/**
 *
 * @author PC PHAN TRONG
 */
public class ClockThread extends Thread{
    private JLabel lbl;

    public ClockThread(JLabel lbl) {
        this.lbl = lbl;
    }
    
    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss aa");
    public void run(){
          while (true){
              Date now = new Date();
              String st = sdf.format(now);
              
              lbl.setText(st);
              try {
                  Thread.sleep(1000);
              } catch (InterruptedException ex) {
                  Logger.getLogger(ClockThread.class.getName()).log(Level.SEVERE, null, ex);
              }
          }
    }
}
