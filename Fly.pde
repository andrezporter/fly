import ddf.minim.*;
Minim       minim;
AudioPlayer buzzing;

int num  =  37;  //Array Size
int soundCounter = 0;
float  Xrange  =  outsideXRandom(250, 240);
float  Yrange  =  outsideYRandom(250, 240);
float[]  ax  =  new  float[num];  
float[]  ay  =  new  float[num]; 
int numFrames = 2;
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
PImage[] deadFly = new PImage[1];
PImage kt;

//////Sets new X goal
float outsideXRandom(float goal, float curLoc){
    if (abs(goal - curLoc) > 5000){
      return goal;
    }
    else {
      float newXNum;
      newXNum = random(curLoc -150,curLoc +150);
      if(newXNum < 0){ newXNum = newXNum + 100;}
      if(newXNum > 400){ newXNum = newXNum - 100;}
      return newXNum;
    }
}

//////Sets new Y goal
float outsideYRandom(float goal, float curLoc){
    if (abs(goal - curLoc) > 5000){
      return goal;
    }
    else {
      float newYNum;
      newYNum = random(0,400);
      if(newYNum < 0){ newYNum = newYNum + 100;}
      if(newYNum > 400){ newYNum = newYNum - 100;}
      return newYNum;
    }
}

//////Loads sound file into project
void soundLoader(){ 
  buzzing = minim.loadFile("buzzbuzz.mp3", 1024);
  soundCounter = soundCounter + 1;
  return  ;    
}

void  setup()  {  
    size(400, 400);  
    minim = new Minim(this);
    frameRate (24);
    images[0] = loadImage("fly1.png"); //Animation setup
    images[1] = loadImage("fly2.png"); 
    deadFly[0]= loadImage("fly4.png");
    kt = loadImage("kitchentile.jpg");

    for(int p = 0; p<num; p++){ //Starting X value
      ax[p] = 200; 
    }
    for(int p = 0; p<num; p++){ //Starting Y value
      ay[p] = 200; 
    } 
}  

void  draw()  { 
  background(kt); 
  float time = millis();
  float floatSubber;
  floatSubber = time/5000; //floatSubber increases by 1 every 5 seconds
  int intSubber;
  intSubber=(int)floatSubber;

  if(intSubber <=18 ){  //Fly flys around for 90 seconds
    if (soundCounter == 0){
      soundLoader();
      buzzing.loop();  
    } 
    println(num); 
    for(int i=1;  i<num;  i++)  {  
      ax[i-1]  =  ax[i];  
      ay[i-1]  =  ay[i];     
    }  
    
    float tux =  Xrange;
    float tuy =  Yrange;
    if(abs(ax[num-1]-tux) > 10 && abs(ay[num-1]-tuy) > 10){

//////If both X goal and Y goal are lower than current location
      else if (ax[num-1] < tux && ay[num-1] < tuy){
         if(time <= 25000){
           ax[num-1]  =  ax[num-1] + random(1,3);
           ay[num-1]  =  ay[num-1] + random(1,3);
         }
        else if(time > 25000 && time <= 65000){
          ax[num-1]  =  ax[num-1] + random(1,7);
          ay[num-1]  =  ay[num-1] + random(1,7);
        }
        else if(time > 65000 && time <= 80000){
          ax[num-1]  =  ax[num-1] + random(1,15);
          ay[num-1]  =  ay[num-1] + random(1,15);
        }
        else if(time > 80000 && time <= 85000){        
          ax[num-1]  =  ax[num-1] + random(1,30);
          ay[num-1]  =  ay[num-1] + random(1,30);
        }
        else if(time > 85000 && time <= 86500){
          ax[num-1]  =  ax[num-1] + random(1,15);
          ay[num-1]  =  ay[num-1] + random(1,15);
        }
        else if(time > 86500 && time <= 88000){
          ax[num-1]  =  ax[num-1] + random(1,7);
          ay[num-1]  =  ay[num-1] + random(1,7);
        }
        else if(time > 88000){
          ax[num-1]  =  ax[num-1] + random(1,1);
          ay[num-1]  =  ay[num-1] + random(1,1);
        }
      }

//////If X goal is Y goal is lower
      else if (ax[num-1] > tux && ay[num-1] < tuy){
        if(time < 25000){
          ax[num-1]  =  ax[num-1] - random(1,3);
          ay[num-1]  =  ay[num-1] + random(1,3);
        }
        else if(time > 25000 && time <= 65000){
          ax[num-1]  =  ax[num-1] - random(1,7);
          ay[num-1]  =  ay[num-1] + random(1,7);
        }
        else if(time > 65000 && time <= 80000){
          ax[num-1]  =  ax[num-1] - random(1,15);
          ay[num-1]  =  ay[num-1] + random(1,15);
        }
        else if(time > 80000 && time <= 85000){        
          ax[num-1]  =  ax[num-1] - random(1,30);
          ay[num-1]  =  ay[num-1] + random(1,30);
        }
        else if(time > 85000 && time <= 86500){
          ax[num-1]  =  ax[num-1] - random(1,15);
          ay[num-1]  =  ay[num-1] + random(1,15);
        }
        else if(time > 86500 && time <= 88000){
          ax[num-1]  =  ax[num-1] - random(1,7);
          ay[num-1]  =  ay[num-1] + random(1,7);
        }
        else if(time > 88000){
          ax[num-1]  =  ax[num-1] - random(1,1);
          ay[num-1]  =  ay[num-1] + random(1,1);
        }
      }

//////f Y goal is X goal is lower
      else if (ax[num-1] < tux && ay[num-1] > tuy){
        if(time < 25000){
          ax[num-1]  =  ax[num-1] + random(1,3);
          ay[num-1]  =  ay[num-1] - random(1,3);
        }
        else if(time > 25000 && time <= 65000){
          ax[num-1]  =  ax[num-1] + random(1,7);
          ay[num-1]  =  ay[num-1] - random(1,7);
        }
        else if(time > 65000 && time <= 80000){
          ax[num-1]  =  ax[num-1] + random(1,15);
          ay[num-1]  =  ay[num-1] - random(1,15);
        }
        else if(time > 80000 && time <= 85000){
          ax[num-1]  =  ax[num-1] + random(1,30);
          ay[num-1]  =  ay[num-1] - random(1,30);
        }
        else if(time > 85000 && time <= 86500){
          ax[num-1]  =  ax[num-1] + random(1,15);
          ay[num-1]  =  ay[num-1] - random(1,15);
        }
        else if(time > 86500 && time <= 88000){
          ax[num-1]  =  ax[num-1] + random(1,7);
          ay[num-1]  =  ay[num-1] - random(1,7);
        }
        else if(time > 88000){
          ax[num-1]  =  ax[num-1] + random(1,1);
          ay[num-1]  =  ay[num-1] - random(1,1);
        }
      }

//////If both X goal and Y goal are higher
      else if (ax[num-1] > tux && ay[num-1] > tuy){
        if(time < 25000){        
          ax[num-1]  =  ax[num-1] - random(1,3);
          ay[num-1]  =  ay[num-1] - random(1,3);
        }
        else if(time > 25000 && time <= 65000){        
          ax[num-1]  =  ax[num-1] - random(1,7);
          ay[num-1]  =  ay[num-1] - random(1,7);
        }
        else if(time > 65000 && time <= 80000){        
          ax[num-1]  =  ax[num-1] - random(1,15);
          ay[num-1]  =  ay[num-1] - random(1,15);
        }
        else if(time > 80000 && time <= 85000){        
          ax[num-1]  =  ax[num-1] - random(1,30);
          ay[num-1]  =  ay[num-1] - random(1,30);
        }
        else if(time > 85000 && time <= 86500){
          ax[num-1]  =  ax[num-1] - random(1,15);
          ay[num-1]  =  ay[num-1] - random(1,15);
        }
        else if(time > 86500 && time <= 88000){
          ax[num-1]  =  ax[num-1] - random(1,7);
          ay[num-1]  =  ay[num-1] - random(1,7);
        }
        else if(time > 88000){
          ax[num-1]  =  ax[num-1] - random(1,1);
          ay[num-1]  =  ay[num-1] - random(1,1);
        }
      } 
    }

    if(abs(ax[num-1]-tux) < 15 && abs(ay[num-1]-tuy) < 30){
      Xrange =  outsideXRandom(tux, ax[num-1]);
      Yrange =  outsideYRandom(tuy, ay[num-1]);
    }

    if(abs(ax[num-1]-tux) < 30 && abs(ay[num-1]-tuy) < 15){
      Xrange =  outsideXRandom(tux, ax[num-1]);
      Yrange =  outsideYRandom(tuy, ay[num-1]);
    }

    if(abs(ax[num-1]-tux) < 10 || abs(ay[num-1]-tuy) < 10){
      Xrange =  outsideXRandom(tux, ax[num-1]);
      Yrange =  outsideYRandom(tuy, ay[num-1]);
    }
 
    for(int i=1;  i<num;  i++)  {  
      if( i > intSubber*2){
        stroke(0);
        fill(0);
        ellipse(ax[i-1],  ay[i-1],  1,  1); 
      }
    }  
    currentFrame = (currentFrame+1) % numFrames;
    image(images[(currentFrame) % numFrames], ax[num-1] - 23, ay[num-1] - 23);
  }
  else{  //After 90 seconds
    buzzing.pause();
    image(deadFly[0], ax[num-1] - 23, ay[num-1] - 23);
    float dropHeight = ay[num-1];
    if (dropHeight < 390){ //Lower the fly straight down until Y equals 390
      ay[num-1]  =  ay[num-1] + 5;
      if (time > 103000){
        exit();
      }  
    }
  }
}  



