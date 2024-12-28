#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/ioctl.h>
#include<linux/i2c-dev.h>
#include<fcntl.h>

//Constants and addresses will be kept here for easy changing

char CMM_Address = 0x01

//Following the steps in section 5, page 28 of the data sheet. 
//Step 1 is to optionally change the cycle count registers, since it's given that the cycle count registers are optimally tuned (favoring resolution), we'll stick with this and skip this step.
//Step 2 is to turn on the device and initiate "single measurement mode".

char REG_POLL = 0x00;

//The following addresses are for the read capacity
char CTRL_X1= 0xA6; 
char CTRL_X2= 0xA5;
char CTRL_X3= 0xA4;
char CTRL_Y1= 0xA9;
char CTRL_Y2= 0xA8;
char CTRL_Y3= 0xA7;
char CTRL_Z1= 0xAC;
char CTRL_Z2= 0xAB;
char CTRL_Z3= 0xAA;

#define OPEN_ERR 0
#define IOCTL_ERR 1
#define WRITE_ERR 2
#define READ_ERR 3
#define filename "/dev/i2c-0"
#define RM3100_I2C_ADDR 0x20
#define POLL_Addr 0x00
#define MX2_Addr 0x24 //this specific oneis for the write capacity

//defining global variables so we can use them in the functions
int X = 0;
int Y = 0;
int Z = 0;

int beginTransmission(int device_add)
{
    int fd;

    if ((fd= open(filename,O_RDWR))<0)
    {
        printf("file open error\n");
        close(fd);
        return OPEN_ERR;
    }

    printf("%s\n",filename);

    if (ioctl(fd,I2C_SLAVE,device_add)<0)
    {
        printf("ioctl error\n");
        close(fd);
        return IOCTL_ERR;
    }
    return fd;
}

void getValues(){

    int fd;
    int val;
    uint8_t write_dev_addr = ((uint8_t)RM3100_I2C_ADDR)<<1;

    fd = beginTransmission(write_dev_addr);
   
    if (write(fd, POLL_Addr, 1) != 1) {
        printf("write reg error");
        return WRITE_ERR;
    }

    uint8_t data = 0x00;
    char buf = (char) data;

    if (write(fd,&data,1)!=1)//Initiating single measurement mode
    {
        printf("write reg error");
        return WRITE_ERR;
    }
    

    
    if (write(fd, RM3100_I2C_ADDR, 1) != 1) {
        printf("write reg error");
        return WRITE_ERR;
    }

    if (write(fd, MX2_Addr, 1) != 1) {
        printf("write reg error");
        return WRITE_ERR;
    }

    //Saving all 9 values (MX2, MX1, MX0, MY2, MY1, MY0, MZ2, MZ1, MZ0) in an array
    uint8_t values[9]; 
    if (read(fd, values, 9) != 9) {
        printf("reg read error");
        return READ_ERR;
    }

    fsync(fd);
    close(fd);

    //Adding all three values for each respective axis to obtain the final value
    X = values[0] + values[1] + values[2];
    Y = values[3] + values[4] + values[5];
    Z = values[6] + values[7] + values[8];
}


int main(void)
{
    while (true) 
    {
        getMagValues(); 
        printf("X: %d",X);
        printf("Y: %d",Y);
        printf("Z: %d",Z);
        sleep(3); //to add the 3 second delay
    }
}