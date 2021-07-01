{
    "process": {
        "sequenceFlow": [
            {
                "targetRef": "ExclusiveGateway_xzq160",
                "businessProp": {},
                "name": "",
                "id": "SequenceFlow_r1byqb",
                "sourceRef": "StartEvent_1p1o0i3",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "ScriptTask_ei79yf",
                "businessProp": {"condition": "{target} == \"OK\""},
                "name": "SI",
                "id": "SequenceFlow_19aqz5p",
                "sourceRef": "ExclusiveGateway_xzq160",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "ScriptTask_4t6b48",
                "businessProp": {"condition": "{target} != \"OK\""},
                "name": "NO",
                "id": "SequenceFlow_1szx0l0",
                "sourceRef": "ExclusiveGateway_xzq160",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "EndEvent_1oyvn0v",
                "businessProp": {},
                "name": "",
                "id": "SequenceFlow_txqk5w",
                "sourceRef": "ScriptTask_4t6b48",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "EndEvent_1oyvn0v",
                "businessProp": {},
                "name": "",
                "id": "SequenceFlow_r4kuq2",
                "sourceRef": "ScriptTask_ei79yf",
                "type": "bpmn:sequenceFlow"
            }
        ],
        "scriptTask": [
            {
                "outgoing": "SequenceFlow_r4kuq2",
                "incoming": "SequenceFlow_19aqz5p",
                "businessProp": {"exec-script": "var a = 1;"},
                "name": "Val2",
                "id": "ScriptTask_ei79yf",
                "type": "bpmn:scriptTask",
                "events": []
            },
            {
                "outgoing": "SequenceFlow_txqk5w",
                "incoming": "SequenceFlow_1szx0l0",
                "businessProp": {"exec-script": "var a = 1;"},
                "name": "Val1",
                "id": "ScriptTask_4t6b48",
                "type": "bpmn:scriptTask",
                "events": []
            }
        ],
        "endEvent": {
            "incoming": [
                "SequenceFlow_txqk5w",
                "SequenceFlow_r4kuq2"
            ],
            "businessProp": {},
            "name": "End",
            "id": "EndEvent_1oyvn0v",
            "type": "bpmn:endEvent"
        },
        "exclusiveGateway": {
            "outgoing": [
                "SequenceFlow_19aqz5p",
                "SequenceFlow_1szx0l0"
            ],
            "incoming": "SequenceFlow_r1byqb",
            "businessProp": {},
            "name": "Verifica",
            "id": "ExclusiveGateway_xzq160",
            "type": "bpmn:exclusiveGateway"
        },
        "startEvent": {
            "outgoing": "SequenceFlow_r1byqb",
            "businessProp": {
                "defaultPriority": "Low",
                "due-date": false,
                "due-date-type": "Custom",
                "priority": false,
                "start-payload-variables": [{
                    "ref": "target",
                    "regex": "",
                    "type": "",
                    "mandatory": true,
                    "errormsg": ""
                }]
            },
            "name": "Start",
            "id": "StartEvent_1p1o0i3",
            "type": "bpmn:startEvent"
        },
        "id": "Process_1789oa9"
    },
    "BPMNDiagram": {
        "bpmnElement": "Process_1789oa9",
        "BPMNPlane": {
            "BPMNShape": [
                {
                    "bpmnElement": "StartEvent_1p1o0i3",
                    "Bounds": {
                        "cx": 205,
                        "cy": 195.5,
                        "x": 187,
                        "width": 36,
                        "y": 166,
                        "height": 59
                    },
                    "id": "StartEvent_1p1o0i3_ve"
                },
                {
                    "bpmnElement": "ExclusiveGateway_xzq160",
                    "Bounds": {
                        "cx": 438,
                        "cy": 171,
                        "x": 413,
                        "width": 50,
                        "y": 157.5,
                        "height": 73
                    },
                    "id": "ExclusiveGateway_xzq160_ve"
                },
                {
                    "bpmnElement": "ScriptTask_ei79yf",
                    "Bounds": {
                        "cx": 728,
                        "cy": 182.50000762939453,
                        "x": 651.0199966430664,
                        "width": 153.9600067138672,
                        "y": 144.3350067138672,
                        "height": 76.33000183105469
                    },
                    "id": "ScriptTask_ei79yf_ve"
                },
                {
                    "bpmnElement": "ScriptTask_4t6b48",
                    "Bounds": {
                        "cx": 438,
                        "cy": 426.99999237060547,
                        "x": 361.0199966430664,
                        "width": 153.9600067138672,
                        "y": 388.8349914550781,
                        "height": 76.33000183105469
                    },
                    "id": "ScriptTask_4t6b48_ve"
                },
                {
                    "bpmnElement": "EndEvent_1oyvn0v",
                    "Bounds": {
                        "cx": 752,
                        "cy": 438.5,
                        "x": 734,
                        "width": 36,
                        "y": 409,
                        "height": 59
                    },
                    "id": "EndEvent_1oyvn0v_ve"
                }
            ],
            "BPMNEdge": [
                {
                    "waypoint": [
                        {
                            "x": "223",
                            "y": "184"
                        },
                        {
                            "x": "318",
                            "y": "184"
                        },
                        {
                            "x": "318",
                            "y": "182.5"
                        },
                        {
                            "x": "413",
                            "y": "182.5"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_r1byqb",
                    "id": "SequenceFlow_r1byqb_ve"
                },
                {
                    "waypoint": [
                        {
                            "x": "463",
                            "y": "182.5"
                        },
                        {
                            "x": "557.0099983215332",
                            "y": "182.5"
                        },
                        {
                            "x": "557.0099983215332",
                            "y": "182.49999908447265"
                        },
                        {
                            "x": "651.0199966430664",
                            "y": "182.49999908447265"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_19aqz5p",
                    "id": "SequenceFlow_19aqz5p_ve",
                    "BPMNLabel": {"Bounds": {
                        "cx": 577,
                        "cy": 159,
                        "x": 537,
                        "width": 80,
                        "y": 147,
                        "height": 24
                    }}
                },
                {
                    "waypoint": [
                        {
                            "x": "438",
                            "y": "207.5"
                        },
                        {
                            "x": "437.9999966430664",
                            "y": "388.83499908447266"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_1szx0l0",
                    "id": "SequenceFlow_1szx0l0_ve",
                    "BPMNLabel": {"Bounds": {
                        "cx": 458,
                        "cy": 275,
                        "x": 418,
                        "width": 80,
                        "y": 263,
                        "height": 24
                    }}
                },
                {
                    "waypoint": [
                        {
                            "x": "514.9799966430664",
                            "y": "426.99999145507815"
                        },
                        {
                            "x": "734",
                            "y": "426.99999237060547"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_txqk5w",
                    "id": "SequenceFlow_txqk5w_ve"
                },
                {
                    "waypoint": [
                        {
                            "x": "727.9999966430664",
                            "y": "220.66500671386717"
                        },
                        {
                            "x": "727.9999966430664",
                            "y": "314.83250335693356"
                        },
                        {
                            "x": "752",
                            "y": "314.83250335693356"
                        },
                        {
                            "x": "752",
                            "y": "409"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_r4kuq2",
                    "id": "SequenceFlow_r4kuq2_ve"
                }
            ]
        },
        "id": "Process_1789oa9_ve"
    },
    "collaboration": {}
}