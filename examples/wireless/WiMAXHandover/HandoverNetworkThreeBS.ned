//
// Copyright (C)  2007 Roland Siedlaczek
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//
package inet.examples.wireless.WiMAXHandover;

import inet.underTest.nodes.WiMAX.WiMAXAP;
import inet.underTest.nodes.WiMAX.WiMAXMS;
import inet.world.radio.ChannelControl;

network HandoverNetworkThreeBS
{
    parameters:
        @display("bgb=1085,582");
    submodules:
        ms1: WiMAXMS {
            parameters:
                @display("p=150,300;i=device/cellphone_s;r=,,#707070");
        }
        bs1: WiMAXAP {
            parameters:
                @display("p=100,300;i=device/antennatower_l;r=,,#707070");
        }
        bs2: WiMAXAP {
            parameters:
                @display("p=300,300;i=device/antennatower_l;r=,,#707070");
        }
        bs3: WiMAXAP {
            parameters:
                @display("p=500,300;i=device/antennatower_l;r=,,#707070");
        }
        channelControl: ChannelControl {
            parameters:
                @display("p=60,50;i=misc/sun");
        }
    connections allowunconnected:
}
