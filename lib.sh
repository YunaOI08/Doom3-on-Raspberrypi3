# Step1. Check For Updates

sudo apt-get update
sudo apt-get upgrade

#----------------------------------------------------------------------------------------------
# Step2. Download Required Dependencies

sudo apt-get install libfontconfig-dev qt5-default automake mercurial libtool libfreeimage-dev \
 libopenal-dev libpango1.0-dev libsndfile-dev libudev-dev libtiff5-dev libwebp-dev libasound2-dev \
libaudio-dev libxrandr-dev libxcursor-dev libxi-dev libxinerama-dev libxss-dev libesd0-dev  \
freeglut3-dev libmodplug-dev libsmpeg-dev libjpeg-dev libogg-dev libvorbis-dev libvorbisfile3 libcurl4

#----------------------------------------------------------------------------------------------
# download SDL2
hg clone http://hg.libsdl.org/SDL
cd SDL
./autogen.sh
./configure --disable-pulseaudio --disable-esd --disable-video-mir --disable-video-wayland --disable-video-opengl --host=arm-raspberry-linux-gnueabihf --prefix=/usr
make -j4
sudo make install

#----------------------------------------------------------------------------------------------
# download&&extract&&build&&install three add-ons
cd ~/temp
wget https://libsdl.org/projects/SDL_image/release/SDL2_image-2.0.5.tar.gz
tar zxvf SDL2_image-2.0.5.tar.gz
cd ~/temp/SDL2_image-2.0.5 && ./autogen.sh && ./configure --prefix=/usr && make && sudo make install

wget https://libsdl.org/projects/SDL_mixer/release/SDL2_mixer-2.0.4.tar.gz
tar zxvf SDL2_mixer-2.0.4.tar.gz
cd ~/temp/SDL2_mixer-2.0.4 && ./autogen.sh && ./configure --prefix=/usr && make && sudo make install

wget https://libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.15.tar.gz
tar zxvf SDL2_ttf-2.0.15.tar.gz
cd ~/temp/SDL2_ttf-2.0.15 && ./autogen.sh && ./configure --prefix=/usr && make && sudo make install

#----------------------------------------------------------------------------------------------
# Step5. Compile Dhewm3
cd ~/temp
git clone https://github.com/dhewm/dhewm3

cd dhewm3/neo/
mkdir build
cd build
cmake ..
make -j4

#----------------------------------------------------------------------------------------------
# Step6. Running Doom3
./dhewm3
GALLIUM_HUM=simple, fps, cpu ./dhewm3
