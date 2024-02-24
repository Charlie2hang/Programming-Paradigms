package finalversion;


import java.io.*;
import java.util.Scanner;

public class ColorHistogram {

    private double[] histogram;
    private int d;
    private ColorImage img;


    public ColorHistogram (int d){
        this.d=d;
        int numberOfBins=(int)Math.pow(2,d*3);
        this.histogram=new double[numberOfBins];
    }

    public ColorHistogram (String fileName) throws FileNotFoundException {
        File img=new File ("./imageDataset2_15_20/"+fileName);

        Scanner scanner=new Scanner(img);
        if (scanner.hasNextLine()){
            scanner.nextLine();
        }else{
            throw new RuntimeException();
        }
        if (scanner.hasNextLine()){
            String[] lineArray=scanner.nextLine().split("\\s+");
            histogram=new double[lineArray.length];
            double sum=0;

            for (int i=0; i<lineArray.length;i++){
                sum+=Double.parseDouble(lineArray[i]);
            }

            for (int i=0; i<lineArray.length;i++){
                histogram[i]=Double.parseDouble(lineArray[i])/sum;
            }
        }
        scanner.close();


    }


    public void setImage(ColorImage image) throws FileNotFoundException {
        this.img=image;
        img.reduceColor(d);
        for(int i=0;i<img.getHeight();i++){
            for(int j=0;j<img.getWidth();j++){
                int[] color=img.getPixel(i,j);
                int index=(color[0]<<(2 * d)) + (color[1]<<d) + (color[2]);
                histogram[index]++;
            }
        }
        double totalPixels= image.getHeight()*image.getWidth();
        for (int i=0;i<histogram.length;i++){
            histogram[i]=histogram[i]/totalPixels;
        }

    }

    public double[] getHistogram(){

        return histogram;
    }
    public double compare(ColorHistogram hist) {
        double result = 0;
        if (hist.getHistogram().length != this.histogram.length) {
            throw new RuntimeException();
        }
        double[] histList = hist.getHistogram();
        for (int i = 0; i < histogram.length; i++) {
            result += Math.min(histList[i], this.histogram[i]);
        }
        return result;
    }

    public void ColorHistogram (String filename){
        try {
            File file=new File(filename);
        }catch (Exception e){
            System.out.println("fail to create the new file"+filename);
        }
        try{
            FileWriter writer=new FileWriter(filename);
            for(double value:histogram){
                writer.write(Double.toString(value));
                writer.write(" ");

            }
            writer.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
