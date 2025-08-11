package  edu.sc.seis.TauP;

/**
 * Simple class for storing the version derived from the gradle build.gradle file.
 * 
 */ 
public class BuildVersion {

    private static final String version = "2.4.0_localmod";
    private static final String name = "TauP";
    private static final String group = "edu.sc.seis";
    private static final String date = "Wed Jul 06 10:11:05 EDT 2016";

    /** returns the version of the project from the gradle build.gradle file. */
    public static String getVersion() {
        return version;
    }
    /** returns the name of the project from the gradle build.gradle file. */
    public static String getName() {
        return name;
    }
    /** returns the group of the project from the gradle build.gradle file. */
    public static String getGroup() {
        return group;
    }
    /** returns the date this file was generated, usually the last date that the project was modified. */
    public static String getDate() {
        return date;
    }
    public static String getDetailedVersion() {
        return getGroup()+":"+getName()+":"+getVersion()+" "+getDate();
    }
}
