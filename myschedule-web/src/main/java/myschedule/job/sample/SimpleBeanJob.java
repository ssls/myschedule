package myschedule.job.sample;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/** 
 * A plain java bean that can be called by scheduler as job execution. Notice
 * that this job doesn't need to implement any interface!
 *
 * @author Zemian Deng
 */
public class SimpleBeanJob {
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	public void run() {
		logger.info("Running bean job.");
	}
}