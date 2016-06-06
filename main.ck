me.sourceDir() + "./data/kick.wav" => string filename;
if( me.args() ) me.arg(0) => filename;

SndBuf buf => dac;
filename => buf.read;

120 => float bpm;
bpm / 60 => float bps;
1::minute / bpm => dur quarter;
1 => float rate;

fun void playNote(dur duration, float freq) {
  now + duration => time later;
  while (now < later) {
    0 => buf.pos;
    if( freq == Std.mtof(0) ) {
      <<<Math.exp(5*rate-5)>>>;
      quarter * Math.exp(5*rate-5) => now;
    } else {
      1::second/freq => now;
    }
  }
}

//playNote(1::minute, Std.mtof(60));

fun void interpolateRate(){
  while(true){
    rate - 0.001 => rate;
    if (rate < 0) {
      1 => rate;
    }
    10::ms => now;
  }
}

while (true) {
  spork ~ playNote(quarter*2, Std.mtof(0));
  quarter * 2 => now;
  spork ~ interpolateRate();
}