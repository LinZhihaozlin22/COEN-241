from mininet.topo import Topo

class BinaryTreeTopo( Topo ):
    "Binary Tree Topology Class."

    def __init__( self ):
        "Create the binary tree topology."

        # Initialize topology
        Topo.__init__( self )

        host, switch = [], []
        # Add hosts
        for i in range(1,9):
            host.append(self.addHost('h'+str(i)))

        # Add switches
        for i in range(1,8):
            switch.append(self.addSwitch('s'+str(i)))

        # Add links
        self.addLink(switches[0], switches[1])
        self.addLink(switches[0], switches[4])
        self.addLink(switches[1], switches[2])
        self.addLink(switches[1], switches[3])
        self.addLink(switches[4], switches[5])
        self.addLink(switches[4], switches[6])

        hSwitch = [2,2,3,3,5,5,6,6]
        for i, v in enumerate(hSwitch):
            self.addLink(switches[v], host[i])
    

topos = { 'binary_tree': ( lambda: BinaryTreeTopo() ) }
