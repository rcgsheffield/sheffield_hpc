.. _filestore:

Filestores
==========

Every HPC user has access to *up to* six different storage areas:

* :ref:`home_dir`: per-user :term:`backed-up <Mirrored backups>`, :term:`snapshotted <Snapshotted storage>` storage
* :ref:`data_dir`: additional per-user snapshotted storage (*not on Bessemer*)
* :ref:`fastdata_dir`: high-performance shared filesystem for temporary data - optimised for reading/writing large files from multiple nodes and threads simultaneously
* :ref:`shared_dir`: per-PI shared storage areas (snapshotted and backed-up) for project data - can be accessed from non-HPC machines too
* :ref:`scratch_dir`: per-node temporary storage - useful for reading/writing lots of small files within *one job*
* :ref:`community_dir`: cluster-wide storage areas to allow users to share software.

The storage areas differ in terms of:

* the amount of space available;
* whether they are available from multiple nodes;
* whether they are shared between clusters;
* whether the underlying storage system is performant if reading/writing large files;
* whether the underlying storage system is performant if reading/writing small files;
* frequency of :term:`storage snapshotting <Snapshotted storage>`, 
  whether storage is :term:`mirrored <Mirrored backups>` 
  and the maximum duration data can be retained for;
* whether they handle permissions like a typical Linux filesystem.

At present none provide *encryption at rest*.

-----

Choosing the correct filestore
------------------------------

To make a quick assessment of what storage area is likely to best fulfil your needs, please take a look at the provided decision tree below:

.. warning::

  This decision tree only provides a quick assessment, please check the full details of each filestore before committing to using them for your work.

.. raw:: html

  <div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2023-05-02T11:20:27.841Z\&quot; agent=\&quot;Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36\&quot; etag=\&quot;kp4ffUZ-Y0QOf62LP7Qp\&quot; version=\&quot;21.2.4\&quot; type=\&quot;device\&quot;&gt;\n  &lt;diagram name=\&quot;Page-1\&quot; id=\&quot;9c096ad6-e400-ecc8-3e38-643d2caac077\&quot;&gt;\n    &lt;mxGraphModel dx=\&quot;2074\&quot; dy=\&quot;1067\&quot; grid=\&quot;1\&quot; gridSize=\&quot;10\&quot; guides=\&quot;1\&quot; tooltips=\&quot;1\&quot; connect=\&quot;1\&quot; arrows=\&quot;1\&quot; fold=\&quot;1\&quot; page=\&quot;1\&quot; pageScale=\&quot;1.5\&quot; pageWidth=\&quot;1169\&quot; pageHeight=\&quot;826\&quot; background=\&quot;none\&quot; math=\&quot;0\&quot; shadow=\&quot;0\&quot;&gt;\n      &lt;root&gt;\n        &lt;mxCell id=\&quot;0\&quot; style=\&quot;;html=1;\&quot; /&gt;\n        &lt;mxCell id=\&quot;1\&quot; style=\&quot;;html=1;\&quot; parent=\&quot;0\&quot; /&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-8\&quot; style=\&quot;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0;exitY=0.5;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;fontFamily=Verdana;fontSize=16;edgeStyle=orthogonalEdgeStyle;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-1\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-58\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint x=\&quot;520\&quot; y=\&quot;260\&quot; as=\&quot;targetPoint\&quot; /&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-11\&quot; value=\&quot;ShARC\&quot; style=\&quot;edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;XzLxbcLt9xksHgqJ0xbW-8\&quot; connectable=\&quot;0\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;0.0755\&quot; y=\&quot;-1\&quot; relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint as=\&quot;offset\&quot; /&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-9\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;fontFamily=Verdana;fontSize=16;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-1\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-59\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint x=\&quot;1240\&quot; y=\&quot;260\&quot; as=\&quot;targetPoint\&quot; /&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-10\&quot; value=\&quot;Bessemer\&quot; style=\&quot;edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;XzLxbcLt9xksHgqJ0xbW-9\&quot; connectable=\&quot;0\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;-0.1106\&quot; y=\&quot;2\&quot; relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint as=\&quot;offset\&quot; /&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-1\&quot; value=\&quot;Which cluster?\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;817\&quot; y=\&quot;100\&quot; width=\&quot;120\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-2\&quot; value=\&quot;&amp;lt;font face=&amp;quot;Verdana&amp;quot;&amp;gt;&amp;lt;b&amp;gt;&amp;lt;font style=&amp;quot;font-size: 16px;&amp;quot;&amp;gt;Sheffield HPC Cluster Storage Selection decision tree:&amp;lt;br&amp;gt;&amp;lt;/font&amp;gt;&amp;lt;/b&amp;gt;&amp;lt;/font&amp;gt;\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;629.5\&quot; y=\&quot;60\&quot; width=\&quot;500\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-38\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=16;startArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-77\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-48\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-66\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=16;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-39\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-44\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-39\&quot; value=\&quot;Does your job read or write lots of small files?\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;600\&quot; y=\&quot;280\&quot; width=\&quot;160\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-42\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=16;startArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-79\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-52\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-65\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=16;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-43\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-44\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-43\&quot; value=\&quot;Does your job read or write lots of small files?\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1000\&quot; y=\&quot;280\&quot; width=\&quot;160\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-44\&quot; value=\&quot;&amp;lt;b&amp;gt;/scratch&amp;lt;/b&amp;gt;\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;820\&quot; y=\&quot;280\&quot; width=\&quot;116.5\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-67\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=16;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-48\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-53\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-87\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=14;startArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-88\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-84\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-48\&quot; value=\&quot;Does your job read or write large files?\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;600\&quot; y=\&quot;420\&quot; width=\&quot;160\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-68\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=16;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-52\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-53\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-86\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=14;startArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-76\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-85\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-52\&quot; value=\&quot;Does your job read or write large files?\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1000\&quot; y=\&quot;420\&quot; width=\&quot;160\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-53\&quot; value=\&quot;&amp;lt;b&amp;gt;/fastdata&amp;lt;/b&amp;gt;\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;816.5\&quot; y=\&quot;420\&quot; width=\&quot;120\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-54\&quot; value=\&quot;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#scratch-directories&amp;quot;&amp;gt;Warning: no backups, separate area &amp;lt;br&amp;gt;&amp;lt;/a&amp;gt;\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;724.5\&quot; y=\&quot;346\&quot; width=\&quot;310\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-55\&quot; value=\&quot;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#fastdata-areas&amp;quot;&amp;gt;Warning: &amp;lt;/a&amp;gt;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#fastdata-areas&amp;quot;&amp;gt;file age limits&amp;lt;/a&amp;gt;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#fastdata-areas&amp;quot;&amp;gt; and &amp;lt;/a&amp;gt;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#fastdata-areas&amp;quot;&amp;gt;no backups&amp;lt;/a&amp;gt;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#fastdata-areas&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;.\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;708.25\&quot; y=\&quot;487\&quot; width=\&quot;340\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-60\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;fontFamily=Verdana;fontSize=16;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-58\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-39\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-82\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0;exitY=0.5;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;fontFamily=Verdana;fontSize=14;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-58\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-81\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-58\&quot; value=\&quot;Are you running a job or storing input / output data?\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;spacing=8;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;360\&quot; y=\&quot;180\&quot; width=\&quot;160\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-62\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0;exitY=0.5;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;fontFamily=Verdana;fontSize=16;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-59\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-43\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-111\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;fontFamily=Verdana;fontSize=14;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-59\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-107\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-59\&quot; value=\&quot;Are you running a job or storing input / output data?\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;spacing=9;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1240\&quot; y=\&quot;180\&quot; width=\&quot;160\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-61\&quot; value=\&quot;Running a job\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;540\&quot; y=\&quot;190\&quot; width=\&quot;110\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-70\&quot; value=\&quot;Running a job\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1110\&quot; y=\&quot;190\&quot; width=\&quot;110\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-71\&quot; value=\&quot;Yes\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;770\&quot; y=\&quot;290\&quot; width=\&quot;40\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-72\&quot; value=\&quot;Yes\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;950\&quot; y=\&quot;290\&quot; width=\&quot;40\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-73\&quot; value=\&quot;Yes\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;770\&quot; y=\&quot;430\&quot; width=\&quot;40\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-75\&quot; value=\&quot;Yes\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;950\&quot; y=\&quot;430\&quot; width=\&quot;40\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-77\&quot; value=\&quot;No\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;665\&quot; y=\&quot;370\&quot; width=\&quot;30\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-78\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=16;endArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-39\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-77\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint x=\&quot;680\&quot; y=\&quot;340\&quot; as=\&quot;sourcePoint\&quot; /&gt;\n            &lt;mxPoint x=\&quot;680\&quot; y=\&quot;420\&quot; as=\&quot;targetPoint\&quot; /&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-79\&quot; value=\&quot;No\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1065\&quot; y=\&quot;370\&quot; width=\&quot;30\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-80\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=16;endArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-43\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-79\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint x=\&quot;1080\&quot; y=\&quot;340\&quot; as=\&quot;sourcePoint\&quot; /&gt;\n            &lt;mxPoint x=\&quot;1080\&quot; y=\&quot;420\&quot; as=\&quot;targetPoint\&quot; /&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-98\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=14;startArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-104\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-93\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-81\&quot; value=\&quot;Do you need to share your data with other users?\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;120\&quot; y=\&quot;280\&quot; width=\&quot;160\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-83\&quot; value=\&quot;Storing data\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;240\&quot; y=\&quot;190\&quot; width=\&quot;100\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-84\&quot; value=\&quot;&amp;lt;b&amp;gt;/home &amp;lt;/b&amp;gt;or &amp;lt;b&amp;gt;/data&amp;lt;/b&amp;gt;&amp;lt;br&amp;gt;&amp;lt;b&amp;gt;&amp;lt;/b&amp;gt;\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;620\&quot; y=\&quot;560\&quot; width=\&quot;120\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-85\&quot; value=\&quot;&amp;lt;b&amp;gt;/home&amp;lt;/b&amp;gt;\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1020\&quot; y=\&quot;560\&quot; width=\&quot;120\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-88\&quot; value=\&quot;No\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;665\&quot; y=\&quot;510\&quot; width=\&quot;30\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-89\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=14;endArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-48\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-88\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint x=\&quot;680\&quot; y=\&quot;480\&quot; as=\&quot;sourcePoint\&quot; /&gt;\n            &lt;mxPoint x=\&quot;680\&quot; y=\&quot;560\&quot; as=\&quot;targetPoint\&quot; /&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-76\&quot; value=\&quot;No\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1065\&quot; y=\&quot;510\&quot; width=\&quot;30\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-90\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=14;endArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-52\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-76\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint x=\&quot;1080\&quot; y=\&quot;480\&quot; as=\&quot;sourcePoint\&quot; /&gt;\n            &lt;mxPoint x=\&quot;1080\&quot; y=\&quot;560\&quot; as=\&quot;targetPoint\&quot; /&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-93\&quot; value=\&quot;Research shared storage area\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;381.75\&quot; y=\&quot;280\&quot; width=\&quot;116.5\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-94\&quot; value=\&quot;&amp;lt;b&amp;gt;/home&amp;lt;/b&amp;gt;\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;220\&quot; y=\&quot;540\&quot; width=\&quot;120\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-95\&quot; value=\&quot;&amp;lt;b&amp;gt;/data&amp;lt;/b&amp;gt;\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;65\&quot; y=\&quot;540\&quot; width=\&quot;120\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-99\&quot; value=\&quot;&amp;lt;b&amp;gt;/home&amp;lt;/b&amp;gt;\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1500\&quot; y=\&quot;560\&quot; width=\&quot;120\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;Vf45G0hu34pnWBJpz1_1-3\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-101\&quot; target=\&quot;Vf45G0hu34pnWBJpz1_1-1\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-101\&quot; value=\&quot;No\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;185\&quot; y=\&quot;370\&quot; width=\&quot;30\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-103\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=14;endArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-81\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-101\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint x=\&quot;200\&quot; y=\&quot;340\&quot; as=\&quot;sourcePoint\&quot; /&gt;\n            &lt;mxPoint x=\&quot;200\&quot; y=\&quot;420\&quot; as=\&quot;targetPoint\&quot; /&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-104\&quot; value=\&quot;Yes\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;310\&quot; y=\&quot;300\&quot; width=\&quot;40\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-105\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=14;endArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-81\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-104\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint x=\&quot;280\&quot; y=\&quot;310\&quot; as=\&quot;sourcePoint\&quot; /&gt;\n            &lt;mxPoint x=\&quot;381.75\&quot; y=\&quot;310\&quot; as=\&quot;targetPoint\&quot; /&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-110\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=14;startArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-121\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-109\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-107\&quot; value=\&quot;Do you need to share your data with other users?\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;spacing=5;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1480\&quot; y=\&quot;280\&quot; width=\&quot;160\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-109\&quot; value=\&quot;Research shared storage area\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1261.75\&quot; y=\&quot;280\&quot; width=\&quot;116.5\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-113\&quot; value=\&quot;Storing data\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1430\&quot; y=\&quot;190\&quot; width=\&quot;100\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;Vf45G0hu34pnWBJpz1_1-11\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;endArrow=classic;endFill=1;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-119\&quot; target=\&quot;Vf45G0hu34pnWBJpz1_1-9\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-119\&quot; value=\&quot;No\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1545\&quot; y=\&quot;370\&quot; width=\&quot;30\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-120\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=14;endArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-107\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-119\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint x=\&quot;1560\&quot; y=\&quot;340\&quot; as=\&quot;sourcePoint\&quot; /&gt;\n            &lt;mxPoint x=\&quot;1560\&quot; y=\&quot;420\&quot; as=\&quot;targetPoint\&quot; /&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-121\&quot; value=\&quot;Yes\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1410\&quot; y=\&quot;300\&quot; width=\&quot;40\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-122\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;fontFamily=Verdana;fontSize=14;endArrow=none;\&quot; parent=\&quot;1\&quot; source=\&quot;XzLxbcLt9xksHgqJ0xbW-107\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-121\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint x=\&quot;1480\&quot; y=\&quot;310\&quot; as=\&quot;sourcePoint\&quot; /&gt;\n            &lt;mxPoint x=\&quot;1378.25\&quot; y=\&quot;310\&quot; as=\&quot;targetPoint\&quot; /&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-123\&quot; value=\&quot;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#home-directories&amp;quot;&amp;gt;Quota: 10GB&amp;lt;/a&amp;gt;\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;220\&quot; y=\&quot;610\&quot; width=\&quot;120\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-124\&quot; value=\&quot;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#data-directories&amp;quot;&amp;gt;Quota: 100GB&amp;lt;/a&amp;gt;\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;60\&quot; y=\&quot;610\&quot; width=\&quot;130\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-125\&quot; value=\&quot;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#home-directories&amp;quot;&amp;gt;Quota: 100GB&amp;lt;/a&amp;gt;\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1495\&quot; y=\&quot;630\&quot; width=\&quot;130\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-126\&quot; value=\&quot;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#home-directories&amp;quot;&amp;gt;Backup and snapshots&amp;lt;/a&amp;gt;\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;110\&quot; y=\&quot;640\&quot; width=\&quot;200\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-127\&quot; value=\&quot;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#home-directories&amp;quot;&amp;gt;Backup and snapshots&amp;lt;/a&amp;gt;\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1460\&quot; y=\&quot;650\&quot; width=\&quot;200\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-129\&quot; value=\&quot;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#shared-project-directories&amp;quot;&amp;gt;Important Details&amp;lt;/a&amp;gt;\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;360\&quot; y=\&quot;344\&quot; width=\&quot;160\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-132\&quot; value=\&quot;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#shared-project-directories&amp;quot;&amp;gt;Important Details&amp;lt;/a&amp;gt;\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1240\&quot; y=\&quot;344\&quot; width=\&quot;160\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-133\&quot; value=\&quot;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#automatic-file-deletion&amp;quot;&amp;gt;Quota: none&amp;lt;/a&amp;gt;.\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;819.5\&quot; y=\&quot;511\&quot; width=\&quot;120\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;XzLxbcLt9xksHgqJ0xbW-134\&quot; value=\&quot;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#scratch-directories&amp;quot;&amp;gt;Quota: none. &amp;lt;br&amp;gt;&amp;lt;/a&amp;gt;\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;819.5\&quot; y=\&quot;388\&quot; width=\&quot;120\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;5y2V_BpxsLosnYlqc_hT-5\&quot; value=\&quot;&amp;lt;a href=&amp;quot;https://docs.hpc.shef.ac.uk/en/latest/hpc/filestore.html#scratch-directories&amp;quot;&amp;gt;per node and files deleted after job stops.&amp;lt;/a&amp;gt;\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=16;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;704.5\&quot; y=\&quot;364\&quot; width=\&quot;350\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;Vf45G0hu34pnWBJpz1_1-5\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;endArrow=none;endFill=0;\&quot; parent=\&quot;1\&quot; source=\&quot;Vf45G0hu34pnWBJpz1_1-1\&quot; target=\&quot;Vf45G0hu34pnWBJpz1_1-4\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;Vf45G0hu34pnWBJpz1_1-8\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0.525;entryY=1.15;entryDx=0;entryDy=0;entryPerimeter=0;endArrow=none;endFill=0;\&quot; parent=\&quot;1\&quot; source=\&quot;Vf45G0hu34pnWBJpz1_1-1\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-104\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;Vf45G0hu34pnWBJpz1_1-1\&quot; value=\&quot;Do you need a larger quota than 100GB?\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;spacing=8;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;120\&quot; y=\&quot;422\&quot; width=\&quot;160\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;Vf45G0hu34pnWBJpz1_1-6\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0;exitY=0.5;exitDx=0;exitDy=0;exitPerimeter=0;\&quot; parent=\&quot;1\&quot; source=\&quot;Vf45G0hu34pnWBJpz1_1-4\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-95\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint x=\&quot;250\&quot; y=\&quot;700\&quot; as=\&quot;sourcePoint\&quot; /&gt;\n            &lt;mxPoint x=\&quot;200\&quot; y=\&quot;560\&quot; as=\&quot;targetPoint\&quot; /&gt;\n            &lt;Array as=\&quot;points\&quot;&gt;\n              &lt;mxPoint x=\&quot;125\&quot; y=\&quot;520\&quot; /&gt;\n            &lt;/Array&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;Vf45G0hu34pnWBJpz1_1-4\&quot; value=\&quot;No\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;185\&quot; y=\&quot;510\&quot; width=\&quot;30\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;Vf45G0hu34pnWBJpz1_1-13\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;endArrow=none;endFill=0;\&quot; parent=\&quot;1\&quot; source=\&quot;Vf45G0hu34pnWBJpz1_1-9\&quot; target=\&quot;Vf45G0hu34pnWBJpz1_1-12\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;Vf45G0hu34pnWBJpz1_1-16\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0;exitY=0.5;exitDx=0;exitDy=0;entryX=0.475;entryY=1.05;entryDx=0;entryDy=0;entryPerimeter=0;endArrow=none;endFill=0;\&quot; parent=\&quot;1\&quot; source=\&quot;Vf45G0hu34pnWBJpz1_1-9\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-121\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;Vf45G0hu34pnWBJpz1_1-9\&quot; value=\&quot;Do you need a larger quota than 100GB?\&quot; style=\&quot;rounded=0;whiteSpace=wrap;html=1;spacing=8;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1480\&quot; y=\&quot;422\&quot; width=\&quot;160\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;Vf45G0hu34pnWBJpz1_1-15\&quot; value=\&quot;\&quot; style=\&quot;edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;endArrow=classic;endFill=1;\&quot; parent=\&quot;1\&quot; source=\&quot;Vf45G0hu34pnWBJpz1_1-12\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint x=\&quot;1560\&quot; y=\&quot;560\&quot; as=\&quot;targetPoint\&quot; /&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;Vf45G0hu34pnWBJpz1_1-12\&quot; value=\&quot;No\&quot; style=\&quot;text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontFamily=Verdana;\&quot; parent=\&quot;1\&quot; vertex=\&quot;1\&quot;&gt;\n          &lt;mxGeometry x=\&quot;1545\&quot; y=\&quot;510\&quot; width=\&quot;30\&quot; height=\&quot;20\&quot; as=\&quot;geometry\&quot; /&gt;\n        &lt;/mxCell&gt;\n        &lt;mxCell id=\&quot;Xy7sciOshUhc_-B9AqPy-4\&quot; value=\&quot;\&quot; style=\&quot;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;edgeStyle=orthogonalEdgeStyle;\&quot; parent=\&quot;1\&quot; source=\&quot;Vf45G0hu34pnWBJpz1_1-4\&quot; target=\&quot;XzLxbcLt9xksHgqJ0xbW-94\&quot; edge=\&quot;1\&quot;&gt;\n          &lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;\n            &lt;mxPoint x=\&quot;230\&quot; y=\&quot;520\&quot; as=\&quot;sourcePoint\&quot; /&gt;\n            &lt;mxPoint x=\&quot;145\&quot; y=\&quot;560\&quot; as=\&quot;targetPoint\&quot; /&gt;\n            &lt;Array as=\&quot;points\&quot;&gt;\n              &lt;mxPoint x=\&quot;280\&quot; y=\&quot;520\&quot; /&gt;\n            &lt;/Array&gt;\n          &lt;/mxGeometry&gt;\n        &lt;/mxCell&gt;\n      &lt;/root&gt;\n    &lt;/mxGraphModel&gt;\n  &lt;/diagram&gt;\n&lt;/mxfile&gt;\n&quot;}"></div>
  <script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>
  <!--
  This flow diagram can be updated by:
  1. Opening and editing 'hpc/Sheffield HPC Cluster Storage Selection decision tree.drawio.xml' in diagrams.net
  2. Updating the version of 'hpc/Sheffield HPC Cluster Storage Selection decision tree.drawio.xml' in this repo by exporting XML of flowchart from diagrams.net
  3. Updating the 'div' above in this file using the HTML export of the flow chart from diagrams.net

  NB this diagrams.net diagram currently uses a remotely hosted version of the diagrams.net JS library (see above) but there's also a copy of that library at _static/js/viewer-static.min.js in case service is ever withdrawn.
  -->

-----

.. _home_dir:

Home directories
----------------
All users have a home directory on each system:

.. tabs::

  .. group-tab:: Stanage

    :underline-bold:`Home filestore area details`

    +------------------------+------+----------------------+-----------------------------------------------+-------------------------+
    | Path                   | Type | Quota per user       | Shared between system login and worker nodes? | Shared between systems? |
    +========================+======+======================+===============================================+=========================+
    | ``/users/$USER``       | NFS  | 50 GB or 300000 files| Yes                                           | No                      |
    +------------------------+------+----------------------+-----------------------------------------------+-------------------------+

    Where ``$USER`` is the user's username.

    See also: :ref:`quota_check` and * :ref:`exceed_quota`.

    :underline-bold:`Home filestore backups and snapshots details`

    .. warning:: 

      **Snapshotting is not enabled** for home areas and these areas are **not backed up**.

  .. group-tab:: Bessemer

    :underline-bold:`Home filestore area details`

    +------------------------+------+----------------+-----------------------------------------------+-------------------------+
    | Path                   | Type | Quota per user | Shared between system login and worker nodes? | Shared between systems? |
    +========================+======+================+===============================================+=========================+
    |``/home/$USER``         | NFS  | 100GB          | Yes                                           | No                      |
    +------------------------+------+----------------+-----------------------------------------------+-------------------------+

    Where ``$USER`` is the user's username.

    .. include:: /referenceinfo/imports/filestores/shared-areas/sharc-bessemer-snapshot-mirror-settings.rst

  .. group-tab:: ShARC

    :underline-bold:`Home filestore area details`

    +------------------------+------+----------------+-----------------------------------------------+-------------------------+
    | Path                   | Type | Quota per user | Shared between system login and worker nodes? | Shared between systems? |
    +========================+======+================+===============================================+=========================+
    |``/home/$USER``         | NFS  | 10GB           | Yes                                           | No                      |
    +------------------------+------+----------------+-----------------------------------------------+-------------------------+

    Where ``$USER`` is the user's username.


    .. include:: /referenceinfo/imports/filestores/shared-areas/sharc-bessemer-snapshot-mirror-settings.rst


------

.. _data_dir:

*Data* directories
------------------

ShARC, (:underline-bold:`only`), has access to an additional larger *data* storage area:

.. tabs::
    
 .. group-tab:: Stanage

    .. warning::
      
      There is no ``/data`` area on Stanage.

 .. group-tab:: Bessemer

    .. warning::
      
      There is no ``/data`` area on Bessemer.

 .. group-tab:: ShARC
      
    +----------+------------------------+------+----------------+-----------------------------------------------+-------------------------+
    | System   | Path                   | Type | Quota per user | Shared between system login and worker nodes? | Shared between systems? |
    +==========+========================+======+================+===============================================+=========================+
    | ShARC    | ``/data/$USER``        | NFS  | 100GB          | Yes                                           | No                      |
    +----------+------------------------+------+----------------+-----------------------------------------------+-------------------------+

    Where ``$USER`` is the user's username.

    See also: :ref:`quota_check` and * :ref:`exceed_quota`.

    :underline-bold:`Data filestore backups and snapshots details`

    +---------------------------+--------------------+
    | Frequency of snapshotting | Snapshots retained |
    +===========================+====================+
    | Every 4 hours             | 10 most recent     |
    +---------------------------+--------------------+
    | Every night               | Last 7 days        |
    +---------------------------+--------------------+

    +-------------------------------+------------------+
    | Frequency of mirrored backups | Backups retained |
    +===============================+==================+
    | Every 4 hours                 | 6 most recent    |
    +-------------------------------+------------------+
    | Every night                   | 28 most recent   |
    +-------------------------------+------------------+

    See also: :ref:`recovering_snapshots`.

    :underline-bold:`Automounting`


    *Data* directories are **made available to you (mounted) on demand**: 
    if you list the contents of just ``/data`` after first logging on then your ``/data/te1st`` subdirectory (where ``te1st`` is your username) might not be shown.
    However, if you list the contents of ``/data/te1st`` itself or change into that directory
    then its contents will appear.  

    Later on if you list the contents of ``/data`` again 
    you may find that ``/data/te1st`` has disappeared again, as 
    it is automatically *unmounted* following a period of inactivity. 



-----

.. _fastdata_dir:

*Fastdata* areas
----------------

**Fastdata** areas are **optimised for large file operations**.  
These areas are `Lustre <https://en.wikipedia.org/wiki/Lustre_(file_system)>`__ filesystems. 

They are are **faster** than :ref:`home_dir`, :ref:`data_dir` and :ref:`shared_dir` when dealing with larger files but 
are **not performant when reading/writing lots of small files** 
(:ref:`scratch_dir` are ideal for reading/writing lots of small temporary files within jobs).
An example of how slow it can be for large numbers of small files is detailed `here <http://www.walkingrandomly.com/?p=6167>`__.

There are separate ``fastdata`` areas on each cluster:

.. tabs::

   .. group-tab:: Stanage

    :underline-bold:`Fastdata filestore area details`

    +---------------------------------------+--------+----------------+---------------------+-------------------------+---------------------------+
    | Path                                  | Type   | Quota per user | Filesystem capacity | Shared between systems? | Network bandwith per link |
    +=======================================+========+================+=====================+=========================+===========================+
    | ``/mnt/parscratch/``                  | Lustre | No limits      | 2 PiB               | No                      | 100Gb/s (*Omni-Path*)     |
    +---------------------------------------+--------+----------------+---------------------+-------------------------+---------------------------+


    :underline-bold:`Managing your files in fastdata areas`

    We recommend users create their own personal folder in the ``/fastdata`` area.  As this doesn't exist by default, you can create it with safe permissions by running the command: ::

        mkdir -m 0700 /mnt/parscratch/users/$USER

    By running the command above, your area will only be accessible to you. If desired, you could have a more sophisticated sharing scheme with private and public directories ::

        mkdir -m 0755 /mnt/parscratch/users/$USER
        mkdir /parscratch/users/$USER/public
        mkdir /parscratch/users/$USER/private

        chmod 755 /parscratch/users/$USER
        chmod 755 /parscratch/users/$USER/public
        chmod 700 /parscratch/users/$USER/private

    :underline-bold:`Fastdata filestore backups and snapshots details`

    .. warning:: 

      **Snapshotting is not enabled** for home areas and these areas are **not backed up**.


    :underline-bold:`File locking`

    As of September 2020 POSIX file locking is enabled on all Lustre filesystems. 
    Prior to this the lack of file locking support on the University's Lustre filesystems caused problems for certain workflows/applications
    (e.g. for programs that create/use SQLite databases).


    :underline-bold:`User Quota management`

    .. warning::

        **There are no automated quota controls in the Stanage fastdata areas** and the Stanage fastdata area currently has no automatic file deletion process.

        We reserve the right to prevent unfair use of this area by users and will manually assess user's usage and establish a dialogue
        with users who are using unfair amounts of this area on a regular basis.

        We also reserve the right to take measures to ensure the continuing functionality of this area which could include scheduled removal of user's files 
        (after informing the user of the scheduled removal).

   .. group-tab:: Bessemer

    :underline-bold:`Fastdata filestore area details`

    +---------------+--------+----------------+---------------------+-------------------------+---------------------------+
    | Path          | Type   | Quota per user | Filesystem capacity | Shared between systems? | Network bandwith per link |
    +===============+========+================+=====================+=========================+===========================+
    | ``/fastdata`` | Lustre | No limits      | 460 TB              | No                      | 25Gb/s Ethernet           |
    +---------------+--------+----------------+---------------------+-------------------------+---------------------------+

    .. include:: /referenceinfo/imports/filestores/shared-areas/sharc-bessemer-fastdata-managing-import.rst

   .. group-tab:: ShARC

    :underline-bold:`Fastdata filestore area details`

    +---------------+--------+----------------+---------------------+-------------------------+---------------------------+
    | Path          | Type   | Quota per user | Filesystem capacity | Shared between systems? | Network bandwith per link |
    +===============+========+================+=====================+=========================+===========================+
    | ``/fastdata`` | Lustre | No limits      | 669 TB              | No                      | 100Gb/s (*Omni-Path*)     |
    +---------------+--------+----------------+---------------------+-------------------------+---------------------------+

    .. include:: /referenceinfo/imports/filestores/shared-areas/sharc-bessemer-fastdata-managing-import.rst




-----

.. _shared_dir:

*Shared* (project) directories
------------------------------

.. include:: /referenceinfo/imports/filestores/shared-areas/shared-area-general-info.rst

See also: :ref:`recovering_snapshots`.
  
Automounting
^^^^^^^^^^^^

Similar to :ref:`data_dir`, subdirectories beneath ``/shared`` are **mounted on demand** on the HPC systems: 
they may not be visible if you simply list the contents of the ``/shared`` directory but 
will be accessible if you ``cd`` (change directory) into a subdirectory e.g. ``cd /shared/my_group_file_share1``.

Specifics for each Cluster
^^^^^^^^^^^^^^^^^^^^^^^^^^

As our HPC cluster are each hosted in different datacentres the policy, configuration and accessibility of the shared areas varies. The infomation for each cluster is shown below:


.. tabs::


   .. group-tab:: Stanage

      :underline-bold:`Shared research area mount availability`

      On the Stanage cluster, shared research areas can be made available **on all login nodes only, upon request**.  This is because:
      
      * The HPC nodes are hosted within a datacentre in Manchester distant from the shared research area filestores hosted within the University's Sheffield datacentres.
      * Network traffic between Stanage and the Sheffield Research Filestore is not encrypted when travelling between Sheffield and Manchester over the dedicated leased line network link.
      * The leased line network link has 10Gb/s of bidirectional transfer available.


      :underline-bold:`Shared research area performance`

      * If you access a ``/shared`` directory stored in Sheffield from Stanage then you may experience slower performance, especially for small files.
      * The comparatively slower network link for Stanage than Bessemer could result in very poor performance if mounted on all worker nodes. This is why shared research areas are only made available on login nodes.
      * Stanage does not have a local shared research area filestore, thus no local shared research areas can be made.

      If you need to access a ``/shared`` area on Stanage please contact `research-it@sheffield.ac.uk <research-it@sheffield.ac.uk>`__ to arrange this.

   .. group-tab:: Bessemer

      :underline-bold:`Shared research area mount availability`

      On the Bessemer cluster shared research areas can be made available **on all HPC nodes upon request**.  This is because:
      
      * The HPC nodes are hosted within a datacentre in Leeds distant from the shared research area filestores hosted within the University's Sheffield datacentres.
      * Network traffic between Bessemer and the Sheffield Research Filestore is not encrypted when travelling between Sheffield and Leeds over the JANET network.


      :underline-bold:`Shared research area performance`

      * If you access a ``/shared`` directory stored in Sheffield from Bessemer then you may experience slower performance, especially for small files.

      If file store performance is a concern, ``/shared`` areas can be created on Bessemer's local shared research area filestores system to improve performance for file access on the Bessemer HPC cluster. Please note that access 
      to a Bessemer local shared research area filestore area from a Sheffield based machine will have a similar performance decrease.

      If you need to access a ``/shared`` area on Bessemer please contact `research-it@sheffield.ac.uk <research-it@sheffield.ac.uk>`__ to arrange this.

   .. group-tab:: ShARC

      :underline-bold:`Shared research area mount availability`

      On the ShARC cluster shared research areas are available **on all HPC nodes**. This is because the HPC nodes are within the same local network as the shared research area filestores as to give maximum performance.

      :underline-bold:`Shared research area performance`

      As the HPC nodes are within the same local network, local NFS filestorage performance is provided.


.. _shared_dir_perms:

.. include:: /referenceinfo/imports/filestores/shared-areas/permissions-behaviour.rst

Further information
^^^^^^^^^^^^^^^^^^^

The documentation for the ``/shared`` storage service includes information on:

* `how access/permissions are managed <https://www.sheffield.ac.uk/it-services/research-storage/access-rights>`__
* `how to create folders with associated permissions <https://www.sheffield.ac.uk/it-services/research-storage/create-folders>`__ 
  within ``/shared`` storage areas

-----

.. _scratch_dir:

*Scratch*  directories
------------------------------

For **jobs that need to read/write lots of small files** the most performant storage will be 
the temporary storage on each node.

This is because with :ref:`home_dir`, :ref:`data_dir`, :ref:`fastdata_dir` and :ref:`shared_dir`,
each time a file is accessed the filesystem needs to request ownership/permissions information from another server
and for small files these overheads are proportionally high. 

For the local temporary store, such ownership/permissions metadata is available on the local machine, 
thus it is faster when dealing with small files.

As the local temporary storage areas are node-local storage and files/folders are deleted when jobs end:

* any data used by the job must be **copied to** the local temporary store when the jobs starts. 
* any output data stored in the local temporary store must also be **copied off** to another area before the job finishes.
  (e.g. to :ref:`home_dir` or :ref:`data_dir`).

Further conditions also apply:

* Anything in the local temporary store area may be deleted periodically when the worker-node is **idle**. 
* The local temporary store area is **not backed up**. 
* There are no quotas for local temporary store storage.
* The local temporary store area uses the **ext4** filesystem.

.. danger::

  The local temporary store areas are temporary and have no backups. If you forget to copy your output data out of the 
  local temporary store area before your job finishes, your data **cannot** be recovered!

Specifics for each Cluster
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. group-tab:: Stanage

    The scheduler will automatically create a per-job directory for you under ``/tmp``.
    The name of this directory is stored in the ``$TMPDIR`` environment variable e.g. 
    
    .. code-block:: console

      [te1st@login1 [stanage] ~]$   srun -c 1 --mem=4G --pty bash -i
      [te1st@node001 [stanage] ~]$  cd $TMPDIR
      [te1st@node001 [stanage] ~]$  pwd
      /tmp/job.2660172

    The scheduler will then clean up (delete) ``$TMPDIR`` at the end of your job, 
    ensuring that the space can be used by other users.

   .. group-tab:: Bessemer

    The scheduler will automatically create a per-job directory for you under ``/scratch``.
    The name of this directory is stored in the ``$TMPDIR`` environment variable e.g. 
    
    .. code-block:: console

      [te1st@bessemer-login1 ~]$  srun -c 1 --mem=4G --pty bash -i
      [te1st@bessemer-node001 ~]$ cd $TMPDIR
      [te1st@bessemer-node001 2660172]$ pwd
      /scratch/2660172

    The scheduler will then clean up (delete) ``$TMPDIR`` at the end of your job, 
    ensuring that the space can be used by other users.

   .. group-tab:: ShARC

    The scheduler will automatically create a per-job directory for you under ``/scratch``.
    The name of this directory is stored in the ``$TMPDIR`` environment variable e.g. 
    
    .. code-block:: console

      [te1st@sharc-login1 ~]$ qrshx
      [te1st@sharc-node003 ~]$ cd $TMPDIR
      [te1st@sharc-node003 667443.1.all.q]$ pwd
      /scratch/667443.1.all.q

    The scheduler will then clean up (delete) ``$TMPDIR`` at the end of your job, 
    ensuring that the space can be used by other users.

    .. warning::

      If using ``qrsh`` on ShARC to start an interactive job then 
      the ``TMPDIR`` environment variable will unfortunately be undefined
      so you will need to manually create a directory under ``/scratch`` (named using your username)
      and this will not be cleaned up when the job ends.




-----

.. _community_dir:

*Community* areas for software
------------------------------

Most data that researchers want to share with their collaborators at the University should reside in :ref:`shared_dir`.
However, as mentioned in :ref:`shared_dir_perms`, these areas may not be ideal for storing executable software/scripts
due to the way permissions are handled beneath ``/shared``.

Also, users may want to install software on the clusters that they want to be accessible by all cluster users.

To address these two needs users can request the creation of a new directory beneath of the three directories listed below
and if their request is granted they will be given write access to this area:

+----------+--------------------------+------+-----------------------------+-------------------------------------+-----------------------------------------+
| System   | Path                     | Type | Software install guidelines | Public index of areas               | Notes                                   |
+==========+==========================+======+=============================+=====================================+=========================================+
| ShARC    | ``/usr/local/community`` | NFS  | :ref:`sharc-community`      | :ref:`sharc-software-install-guide` | Also available at ``/usr/local/extras`` |
+----------+--------------------------+------+-----------------------------+-------------------------------------+-----------------------------------------+
| Bessemer | ``/usr/local/community`` | NFS  |                             |                                     |                                         |
+----------+--------------------------+------+-----------------------------+-------------------------------------+-----------------------------------------+
| Stanage  | N/A                      | N/A  |                             |                                     |                                         |
+----------+--------------------------+------+-----------------------------+-------------------------------------+-----------------------------------------+

Note that:

* Software installation should follow our installation guidelines where provided.
* Software installations must be maintained by a responsible owner.
* Software which is not actively maintained may be removed.

-----

.. _quota_check:

How to check your quota usage
-----------------------------

To find out your storage quota usage for your :ref:`home directory <home_dir>` and :ref:`data directory <data_dir>` (if on ShARC) 
you can use the ``quota`` command:

.. tabs::

   .. group-tab:: Stanage

      .. code-block:: console

          [te1st@login1 [stanage] ~]$ quota -u -s
              Filesystem   space   quota   limit   grace   files   quota   limit   grace
          storage:/export/users
                           3289M  51200M  76800M            154k    300k    350k 

   .. group-tab:: Bessemer

      .. code-block:: console

            [te1st@bessemer-node004 binary]$ quota

            Size  Used Avail Use%  Mounted on
            100G  100G    0G 100%  /home/te1st

      In the above, you can see that the quota was set to 100 gigabytes and all of this is in use which is likely to cause jobs to fail.

      To determine usage in a particular :ref:`shared_dir` you can use the ``df`` command like so: 

      .. code-block:: console

          [te1st@bessemer-node004 binary]$ df -h /shared/myproject1
          Filesystem                        Size  Used Avail Use% Mounted on
          172.X.X.X:/myproject1/myproject1   10T  9.1T  985G  91% /shared/myproject1

      To assess what is using up your quota within a given directory, you can make use of the 
      :ref:`ncdu module on Bessemer <ncdu_bessemer>`. The **ncdu** utility will give you an 
      interactive display of what files/folders are taking up storage in a given directory tree.

   .. group-tab:: ShARC

      .. code-block:: console

            [te1st@sharc-node004 binary]$ quota

            Size  Used Avail Use%  Mounted on
            10G    10G    0G 100%  /home/te1st
            100G     0  100G   0%  /data/te1st

      In the above, you can see that the quota was set to 10 gigabytes and all of this is in use which is likely to cause jobs to fail.

      To determine usage in a particular :ref:`shared_dir` you can use the ``df`` command like so: 

      .. code-block:: console

          [te1st@sharc-node004 binary]$ df -h /shared/myproject1
          Filesystem                        Size  Used Avail Use% Mounted on
          172.X.X.X:/myproject1/myproject1   10T  9.1T  985G  91% /shared/myproject1

      To assess what is using up your quota within a given directory, you can make use of the 
      :ref:`ncdu module on ShARC <ncdu_sharc>`. The **ncdu** utility will give you an 
      interactive display of what files/folders are taking up storage in a given directory tree.

      To determine usage in a particular :ref:`shared_dir` you can use the ``df`` command like so: 

      .. code-block:: console

          [te1st@login1 [stanage] ~]$  df -h /shared/myproject1
          Filesystem                        Size  Used Avail Use% Mounted on
          172.X.X.X:/myproject1/myproject1   10T  9.1T  985G  91% /shared/myproject1

      To assess what is using up your quota within a given directory, you can make use of the 
      :ref:`ncdu module on Stanage <ncdu_stanage>`. The **ncdu** utility will give you an 
      interactive display of what files/folders are taking up storage in a given directory tree.

-----

.. _exceed_quota:

If you exceed your filesystem quota
-----------------------------------

If you reach your quota for your :ref:`home directory <home_dir>` then
many common programs/commands may cease to work as expected or at all and
you may not be able to log in.

In addition, jobs may fail if you exceed your quota with a job making use of your 
:ref:`data directory <data_dir>` or a :ref:`Shared (project) directory <shared_dir>`.

In order to avoid this situation it is strongly recommended that you:

* :ref:`Check your quota usage <quota_check>` regularly.
* Copy files that do not need to be backed up to a :ref:`Fastdata area <fastdata_dir>`
  or remove them from the clusters completely.

-----

.. _recovering_snapshots:

.. include:: /referenceinfo/imports/filestores/shared-areas/recovering-from-snapshots.rst
