# blastEasy Setup Instructions

Instructions to Instructor:

**Note: Setup time takes around half an hour prior to class**

+ To deploy blastEasy setup on CyVerse Atmosphere cloud, you will need access to [Atmosphere](www.atmo.cyverse.org).
+ You will need to launch a Master instance that will host sequenceServer and one or more `Work_Queue_Factory` instances as needed to distribute the blast jobs. 

**Note:** For this setup to work, blast databases should be placed in a folder named and under the root as `/Data` (creating one requires `sudo` rights) on both Master and Worker VMs. 

**Also Note:** This sequenceServer image has three test protein databases (mouse.1, mouse.2, zebrafish.1) in `/Data` that can be used for testing. 

### Steps:

1. Launch a Master (small) instance which will broadcast as a Master using **[this](https://atmo.cyverse.org/application/images/1756)** image.

2. Launch a Worker (medium to large) instance with this image with **[this](https://atmo.cyverse.org/application/images/1748)** cctools image. 

3. On the Master VM, launch sequenceServer as follows:
`sequenceserver -d /Data`

4. Now anyone can open a web-browser and go to `IP_ADDRESS_of_Master_VM:PORT` to access sequence server front-end. 

5. Connect Work_Queue_Factory to Master VM before submitting blast jobs by
`work_queue_factory IP PORT -T local -w Min_NUM_OF_Workers`

**NOTE: The PORT for connecting work_queue_factory above would be the (Sequence_Server_PORT NUM + 1)** 

**Note:** One can connect as many `Work_Queue_Factory's` as needed as above but, make sure to have the blast databases in the same path as Master and other workers in `/Data`.

6. Once worker factory is connected, blast queries can be submitted and results can be accessed using front end while the time to blast query is printed on the Master VM backend terminal for benchmarking. 
