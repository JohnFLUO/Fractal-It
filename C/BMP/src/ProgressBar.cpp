/*


*/
#include "ProgressBar.h"

void removeCurrentConsoleLine() {
  removeConsoleLines(1);
}

void removeConsoleLines(int numberOfLinesToRemove) {
  //generation seq echapement :
  char moveup[5];
  sprintf(moveup, "%c[1A", 0x1B);
  char clearline[5];
  sprintf(clearline, "%c[2K", 0x1B);
  for (int i = 0; i < numberOfLinesToRemove; i++){
     printf("%s", moveup);
     printf("%s", clearline);
  }
  cout << std::flush;
}

/******************
    ProgressBar
******************/

ProgressBar::ProgressBar() {
  cout << endl;
  Refresh(0);
}

void ProgressBar::Refresh(int progressPercent) {
  static int oldProgressPercent = 0;
  if (progressPercent != oldProgressPercent) {
    removeCurrentConsoleLine();

    // Display progress bar :
    printf("%3d", progressPercent);
    cout << "% [";
    cout << string(progressPercent, '=');
    cout << string(100-progressPercent, ' ');
    cout << "]" << endl;
    oldProgressPercent = progressPercent;
  }
}

void ProgressBar::Refresh(float progPercent) {
  float progressPercent = (floor((progPercent*2)+0.5)/2); //rounding to 0.5
  static float oldProgressPercent = 0;
  if (progressPercent != oldProgressPercent) {
    removeCurrentConsoleLine ();

    // Display progress bar :
    printf("%3d", (int)progressPercent);
    cout << "% [";
    cout << string((int)progressPercent, '=');
    if (progressPercent - (int)progressPercent >= 0.5) { //checking decimal val
      cout << "-" << string(99-(int)progressPercent, ' ');
    } else {
      cout << string(100-(int)progressPercent, ' ');
    }
    cout << "]" << endl;
    oldProgressPercent = progressPercent;
  }
}
