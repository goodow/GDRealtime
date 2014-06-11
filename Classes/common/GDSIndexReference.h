// Copyright 2014 Goodow.com. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//
//  GDSIndexReference.h
//  GDStore
//
//  Created by Larry Tin.
//

#import "GDSCollaborativeObject.h"

@protocol GDSReferenceShiftedEvent;
@protocol GDCRegistration;

/**
 * An GDSIndexReference is a pointer to a specific location in a collaborative list or string. This
 * pointer automatically shifts as new elements are added to and removed from the object.
 * <p>
 * To listen for changes to the referenced index, add an EventListener for
 * <ul>
 * <li>{@link GDSEventType#REFERENCE_SHIFTED}
 * </ul>
 * <p>
 * This class should not be instantiated directly. To create an index reference, call
 * registerReference on the appropriate string or list.
 */
@protocol GDSIndexReference <GDSCollaborativeObject>

- (id<GDCRegistration>)onReferenceShifted:(void (^)(id<GDSReferenceShiftedEvent>))handler;

/**
 * @return Whether this reference can be deleted. Read-only. This property affects the behavior of
 *         the index reference when the index the reference points to is deleted. If this is true,
 *         the index reference will be deleted. If it is false, the index reference will move to
 *         point at the beginning of the deleted range.
 */
- (BOOL)canBeDeleted;

/**
 * @return The index of the current location the reference points to. Write to this property to
 *         change the referenced index.
 */
- (int)index;

/**
 * Change the referenced index.
 *
 * @see #index()
 * @param index the new referenced index.
 */
- (void)setIndex:(int)index;

/**
 * @return The object this reference points to. Read-only.
 */
- (id)referencedObject;

@end