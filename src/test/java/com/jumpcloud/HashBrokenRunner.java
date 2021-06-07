package com.jumpcloud;

import com.intuit.karate.junit5.Karate;

public class HashBrokenRunner {

    @Karate.Test
    Karate testHashBroken() {
        return Karate.run("hashbroken").relativeTo(getClass());
    }    

	
}
