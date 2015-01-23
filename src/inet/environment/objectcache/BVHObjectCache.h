//
// Copyright (C) 2014 OpenSim Ltd.
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
// along with this program; if not, see <http://www.gnu.org/licenses/>.
//

#ifndef __INET_BVHOBJECTCACHE_H
#define __INET_BVHOBJECTCACHE_H

#include "inet/environment/objectcache/IObjectCache.h"
#include "inet/common/geometry/container/BVHTree.h"
#include "inet/environment/PhysicalEnvironment.h"
#include "inet/environment/PhysicalObject.h"
#include "inet/common/IVisitor.h"

namespace inet {

class BVHObjectCache : public IObjectCache, public cModule
{
  protected:
    /** @name Parameters */
    //@{
    PhysicalEnvironment *physicalEnvironment;
    unsigned int leafCapacity;
    const char *axisOrder;
    //@}

    /** @name Cache */
    //@{
    mutable BVHTree *bvhTree;
    mutable std::vector<const PhysicalObject *> objects;
    //@}

  protected:
    virtual int numInitStages() const override { return NUM_INIT_STAGES; }
    virtual void initialize(int stage) override;

  public:
    BVHObjectCache();
    virtual ~BVHObjectCache();

    bool insertObject(const PhysicalObject *object) override;
    void visitObjects(const IVisitor *visitor, const LineSegment& lineSegment) const override;
};

} // namespace inet

#endif // ifndef __INET_BVHOBJECTCACHE_H

