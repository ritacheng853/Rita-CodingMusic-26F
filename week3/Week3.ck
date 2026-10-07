{ 
    TriOsc s => dac;  

    .15 => s.gain;
  
    for(48 => int i; i <= 72; i++)  
    {  
        Std.mtof(i) => float Hz;//MIDI to hertz  
        <<< i, Hz >>>;  
        Hz => s.freq;  
      
        130::ms => now;  
    }  

    for(72 => int i; i >= 60; i--)  
    {  
        Std.mtof(i) => float Hz;
        Hz => s.freq;

        100::ms => now;
    }
} 
 
 
{ 
   
  
    -10 => int negative_int;  
  
    -1.3678 => float negative_float;  
 
    // Std commands for absolute values  
    Std.abs(negative_int) => int abs_int;  
    Std.fabs(negative_float) => float abs_float;  
  
    <<< abs_int, abs_float >>>;  
} 
 
 
{ 
    
    1 => int volume;  
 
    60.72 => float MIDI_note;  
  
     
    volume => float f_volume;  
    Std.ftoi(MIDI_note) => int i_MIDI_note;  
 
    <<< f_volume, i_MIDI_note >>>;  
} 
 
 
{ 

    for(0 => int x; x < 5; x++) 
    {  
        Math.random2f(-1.67, 3.45) => float i;  
        <<< i >>>;  
        .4::second => now;  
    }  
} 
 
 
{ 
    SqrOsc s => dac;  
  
    Math.srandom(151);//set seed  
  
    for(0 => int x; x < 6; x++) 
    {  
        Math.random2(220, 500) => int i;  
        Math.random2f(.1, .20) => float v;  
 
        <<< i, v >>>;  
 
        i => s.freq;  
        v => s.gain;  
 
        .25::second => now;  
    }  
} 
 
 
{ 
    SinOsc s => dac.left;  
    SinOsc t => dac.right;  

    .13 => s.gain;
    .13 => t.gain;
  
    220.00 => s.freq;  
    329.63 => t.freq;  
  
    1::second => now;  
} 
 
 
{ 
    SinOsc s => Pan2 p => dac;  

    .13 => s.gain;
    261.63 => s.freq;
 
    -1.0 => p.pan;  
    .5::second => now;  
  
    1.0 => float panPosition;  
  
    //loop  
    while(panPosition > -1.0)  
    {  
        panPosition => p.pan;  
      
        <<< panPosition >>>;  
 
        panPosition - .02 => panPosition;  
        .02::second => now;  
    }  
} 
 
 
{ 
    Noise n => Pan2 p => dac;  

    .07 => n.gain;
    0 => p.pan;

    1.5::second => now;
}

 
 
{
    SqrOsc s => dac; 
 
    .15 => s.gain; 
  
    // array declaration  
    [52,56,62,53,48,50,52] @=> int A[];  
 
    [55,59,62,59,57,55,52] @=> int C[];  
 
    [.5,.2,.1,.4,.5,.6,.7] @=> float notes[];  
  
 
    // A
    for(0 => int i; i < A.cap(); i++)  
    {  
        <<< i, A[i] >>>;  
 
        Std.mtof(A[i]) => s.freq;  
        notes[i]::second => now;  
    }  

    .2::second => now;
 
 
    for(0 => int i; i < C.cap(); i++)  
    {  
        <<< i, C[i] >>>;  
 
        Std.mtof(C[i]) => s.freq;  
        notes[i]::second => now;  
    }  

    .2::second => now;
 
 
    // A again
    for(0 => int i; i < A.cap(); i++)  
    {  
        <<< i, A[i] >>>;  
 
        Std.mtof(A[i]) => s.freq;  
        notes[i]::second => now;  
    }  
}