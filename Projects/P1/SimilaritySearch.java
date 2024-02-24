package finalversion;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.util.*;



public class SimilaritySearch {



    public static void main(String[] args) throws FileNotFoundException {
//        for(String i:args){
//            System.out.println(i);
//        }
        File folder=new File("./"+args[1]);
        FilenameFilter txtFileFilter=new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                return name.endsWith(".txt");
            }
        };
        File[] files=folder.listFiles(txtFileFilter);
        ArrayList<String> fileList=new ArrayList<>();
        if(files!=null){
            for(File file:files){
                fileList.add(file.getName());
            }
        }else{
            System.out.println("the dataset folder is empty");
        }
        ColorImage targetImg=new ColorImage(args[0]);
        ColorHistogram targetHistogram=new ColorHistogram(3);
        targetHistogram.setImage(targetImg);



        double[] intersectionArray=new double[fileList.size()];

        for(int i=0; i<intersectionArray.length;i++){
            ColorHistogram currentFile=new ColorHistogram(fileList.get(i));
            intersectionArray[i]= targetHistogram.compare(currentFile);
        }
        TreeMap<Double,String> fileMap=new TreeMap<>();
        for(int i=0;i<intersectionArray.length;i++){
            fileMap.put(intersectionArray[i],fileList.get(i));
        }
        NavigableMap<Double,String> sortedMap= fileMap.descendingMap();
        int count=1;
        for(Map.Entry<Double,String>entry : sortedMap.entrySet()){
            if (count<6){
                System.out.println("The "+count+" Similarity: "+ entry.getValue()+" with Similarity value= "+entry.getKey());

                count++;
            }else{
                break;
            }
        }

    }
}