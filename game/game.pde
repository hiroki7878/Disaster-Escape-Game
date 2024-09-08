Button btnEarthquake;
Button btnTsunami;
Button clearButton;
PImage start_back;
PImage test_back;
PImage imgEarthquake;
PImage imgTsunami;
PImage imgClear1;
PImage imgClear2;
PImage clear_back;
PImage title;
PImage clear_message;

int dx = displayWidth;
int dy = displayHeight;
int scene=0;
int baseTime = 0;
int png = 0;

void setup() {
  surface.setResizable(true);
  size(1200, 800);
  
  //size(dx,dy);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  textAlign(CENTER, CENTER);
  
  PFont font = createFont("Meiryo", 100);
  textFont(font);
  btnEarthquake=new Button(width/2, height/2, 200, 100, color(#FF9933), "地震モード");
  btnTsunami=new Button(width/2, height/2+150, 200, 100, color(#3399FF), "津波モード");
  clearButton=new Button(width/2, height/2+150, 200, 100, color(#3399FF), "OK");
  
  start_back = loadImage("./pictures/social-okayama.jpg");
  // 画像をぼかす
  start_back.filter(BLUR,10);
  
  imgEarthquake = loadImage("./pictures/earthquake.png");
  imgTsunami = loadImage("./pictures/tsunami.png");
  imgClear1 = loadImage("./pictures/clear1.png");
  imgClear2 = loadImage("./pictures/clear2.png");
  clear_back = loadImage("./pictures/clear_back.png");
  title = loadImage("./pictures/title.png");
  clear_message = loadImage("./pictures/clear_message.png");
  test_back = loadImage("https://www.kibitujinja.com/webcam/cam_parking.jpg");
}

void draw() {
  background(0, 0, 100);
  fill(255, 255, 255);
  PFont font = createFont("Meiryo", 100);
  textFont(font);
  
  // 画像を表示
  image(start_back, 0, 0, width, height);
  image(title, width/2 - 514, height/8);
  //タイトルを表示
  //text("災害脱出ゲーム（仮）", width/2, height/8);
  
  btnEarthquake.x = width/2;
  btnEarthquake.y = height/2;
  btnTsunami.x = width/2;
  btnTsunami.y = height/2+150;
  
  int time = millis() - baseTime;
    
  //画面の表示切替
  switch(scene) 
  {
   //モード選択画面
   case 0:
    Select_Process();
    break;
   //避難中画面
   case 1:    
    //text("避難中", width/2, height/4);
    // 画像を表示
    image(test_back, 0, 0, width, height);
    if(time >= 3000)
    { 
      baseTime = millis();
      scene = 3;
    }    
    break;
    
   //クリア画面
   case 3:
    Clear_Process(time);
    break;
   }
}

//モード選択画面処理
void Select_Process()
{
    btnEarthquake.run();
    btnTsunami.run();
    
    //地震ボタンにマウスがあるとき
    if(btnEarthquake.checkInMouse() )
    {
      image(imgEarthquake, width/2 + 150, height/2 - 100);
    }
    
    //津波ボタンにマウスがあるとき
    if(btnTsunami.checkInMouse() )
    {
      image(imgTsunami, width/2 + 150, height/2 - 100);
    }

    //地震ボタン押下時
    if (btnEarthquake.isPush()) {
      baseTime = millis();
      scene = 1;
    }
    //else if(btnTsunami.isPush()){
    //  scene = 2;
    //}
}

//クリア画面表示
//a_time:imgClear1,imgClear2の表示時間
void Clear_Process(int a_time){
    image(clear_back, 0, 0, width, height);
    //text("CLEAR!", width/2, height/4);
    image(clear_message, width/2 - 250, height/8);
    if(png == 0)
    {
      image(imgClear1, width/2- 250, height/2);
      if(a_time >= 1000)
      {
        png = 1;
        baseTime = millis();
      }
    }
    else
    {
      image(imgClear2, width/2- 250, height/2);
      if(a_time >= 1000)
      {
        png = 0;
        baseTime = millis();
      }
    }
}
