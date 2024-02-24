package finalversion;

import java.io.File;
import java.util.ArrayList;
import java.util.Scanner;
import java.io.FileNotFoundException;



public class ColorImage {

    private int width;
    private int height;
    private int depth;

    private String imgName;

    private ArrayList<int[]> pixelList = new ArrayList<int[]>();

    public ColorImage(String filename) throws FileNotFoundException {
        this.imgName=filename;
        File img=new File ("./queryImages/"+imgName);
        Scanner reader= new Scanner(img);
        while (reader.hasNextLine()){
            String line= reader.nextLine();
//            System.out.println(line);
            if(line.startsWith("#")){
                continue;
            } else if (line.equals("P3")) {
                continue;
            }
            String[] lineArray=line.split("\\s+");

            if (lineArray.length==2){
                width=Integer.parseInt(lineArray[0]);
                height=Integer.parseInt(lineArray[1]);

            }else if(lineArray.length==1){
                depth=(int)Math.ceil(Math.log(Integer.parseInt(lineArray[0]) + 1) / Math.log(2));
            }else{
                for (int x=0;x<lineArray.length;x+=3) {
                    int[] color = new int[3];
                    color[0] = Integer.parseInt(lineArray[x]);
                    color[1] = Integer.parseInt(lineArray[x + 1]);
                    color[2] = Integer.parseInt(lineArray[x + 2]);
                    pixelList.add(color);
                }
            }
        }
        reader.close();
    }
    public int[] getPixel(int i, int j) throws FileNotFoundException {
        int targetPixelIndex=(pixelList.size()/width)*j+i;
        return pixelList.get(targetPixelIndex);

    }

    public void reduceColor(int d){
        for (int[] tempList : pixelList) {
            for (int j = 0; j < 3; j++) {
                int tempInt = tempList[j];
                int reducedInt = tempInt >>>8-d;
                tempList[j] = reducedInt;
            }
        }
    }

    public int getWidth() {
        return width;
    }

    public int getHeight() {
        return height;
    }

    public int getDepth() {
        return depth;
    }


//    for test purpose

//    public static void main(String[] args) throws FileNotFoundException {
//        ColorImage img=new ColorImage("q02.ppm");
//        System.out.println(img.width);
//        System.out.println(img.height);
//        System.out.println(img.depth);
//
//        int[] test=img.getPixel(0,1);
//
//        for(int i=0;i<test.length;i++){
//            System.out.println(test[i]);
//        }
//        img.reduceColor(3);
//        test=img.getPixel(0,1);
//        for(int i=0;i<test.length;i++){
//            System.out.println(test[i]);
//        }

//    }
}
