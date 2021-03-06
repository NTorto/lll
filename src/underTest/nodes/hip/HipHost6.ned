//*********************************************************************************
// File:           HipHost6.ned
//
// Authors:        Laszlo Tamas Zeke, Levente Mihalyi, Laszlo Bokor
//
// Copyright: (C) 2008-2009 BME-HT (Department of Telecommunications,
// Budapest University of Technology and Economics), Budapest, Hungary
//
// Copyright (C) 2004 Andras Varga
// Copyright (C) 2000 Institut fuer Telematik, Universitaet Karlsruhe
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//
//**********************************************************************************
// Part of: HIPSim++ Host Identity Protocol Simulation Framework developed by BME-HT
//**********************************************************************************
// Adapted to Inetmanet by Alfonso Ariza
// 
// Copyright (C) 2011 Alfonso Ariza

package inet.underTest.nodes.hip;

import inet.nodes.ipv6.StandardHost6;
import inet.underTest.hip.base.HIP;



//
// \IPv6 host with TCP, UDP layers and applications.
//
module HipHost6 extends StandardHost6
{
    submodules:
        hip: HIP {
            parameters:
                @display("i=block/star;p=297,200");
        }
    connections allowunconnected:
        tcp.ipv6Out --> hip.tcpIn;
        hip.tcp6Out --> networkLayer.tcpIn;
        tcp.ipv6In <-- hip.tcpOut;
        hip.tcp6In <-- networkLayer.tcpOut;


        udp.ipv6Out --> hip.udpIn;
        hip.udp6Out --> networkLayer.udpIn;
        udp.ipv6In <-- hip.udpOut;
        hip.udp6In <-- networkLayer.udpOut;
        //hip.fromNetworkAddrChange <-- networkLayer.ipchangeOut;
}

