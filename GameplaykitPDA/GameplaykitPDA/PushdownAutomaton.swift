//
//  PushdownAutomaton.swift
//  GameplaykitPDA
//
//  Created by Roberto Osorio Goenaga on 8/13/15.
//  Copyright © 2015 Roberto Osorio Goenaga. All rights reserved.
//

import GameplayKit


@available(OSX 10.11, *)
struct StackElement {
    // this struct can be modified to keep track of anything the PDA element needs to do
    // initially, set currentState to whatever state to start on (see init)
    var currentState: AnyClass = OneState.self
}

@available(OSX 10.11, *)
class PushdownAutomaton {
    
    let stateMachine: GKStateMachine
    
    var stack = [StackElement]()
    
    var currentElement: StackElement?
    
    required init(states: [GKState], firstElement: StackElement) {
        stateMachine = GKStateMachine(states: states)
        currentElement = firstElement
        stateMachine.enterState(currentElement!.currentState)
    }
    
    func pushToStack(object: StackElement) {
        stack.append(object)
        currentElement = StackElement()
    }
    
    func popFromStack() -> StackElement {
        return stack.removeLast()
    }
    
    func updateWithDeltaTime(seconds: NSTimeInterval) {
        stateMachine.updateWithDeltaTime(seconds)
    }
    
    func enterState(state: AnyClass) {
        stateMachine.enterState(state)
        currentElement!.currentState = state.self
    }
    
    /**
        Replaces top of stack with currently running element and vice-versa
    */
    func popAndPush() {
        let tmp = popFromStack()
        stateMachine.enterState(tmp.currentState)
        pushToStack(currentElement!)
        currentElement = tmp
    }
    
}

