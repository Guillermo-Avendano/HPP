{
    "process": {
        "sequenceFlow": [
            {
                "targetRef": "ExclusiveGateway_ii7wwz",
                "businessProp": {},
                "name": "",
                "id": "SequenceFlow_1a7nlbo",
                "sourceRef": "StartEvent_1vil7bl",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "UserTask_14in0bl",
                "businessProp": {"condition": "{target} == \"SOLICITANTE\""},
                "name": "SOLICITANTE",
                "id": "SequenceFlow_27tbgs",
                "sourceRef": "ExclusiveGateway_ii7wwz",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "EndEvent_1p7gkga",
                "businessProp": {},
                "name": "",
                "id": "SequenceFlow_19fdkug",
                "sourceRef": "UserTask_14in0bl",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "EndEvent_spet5s",
                "businessProp": {"condition": "{target} != \"SOLICITANTE\""},
                "name": "NO",
                "id": "SequenceFlow_xojf30",
                "sourceRef": "ExclusiveGateway_ii7wwz",
                "type": "bpmn:sequenceFlow"
            }
        ],
        "endEvent": [
            {
                "incoming": "SequenceFlow_19fdkug",
                "businessProp": {},
                "name": "End",
                "id": "EndEvent_1p7gkga",
                "type": "bpmn:endEvent"
            },
            {
                "incoming": "SequenceFlow_xojf30",
                "businessProp": {},
                "name": "End",
                "id": "EndEvent_spet5s",
                "type": "bpmn:endEvent"
            }
        ],
        "exclusiveGateway": {
            "outgoing": [
                "SequenceFlow_27tbgs",
                "SequenceFlow_xojf30"
            ],
            "incoming": "SequenceFlow_1a7nlbo",
            "businessProp": {},
            "name": "Verifica Solicitante",
            "id": "ExclusiveGateway_ii7wwz",
            "type": "bpmn:exclusiveGateway"
        },
        "startEvent": {
            "outgoing": "SequenceFlow_1a7nlbo",
            "businessProp": {
                "defaultPriority": "Low",
                "due-date": false,
                "due-date-type": "Custom",
                "priority": false,
                "start-payload-variables": []
            },
            "name": "Start",
            "id": "StartEvent_1vil7bl",
            "type": "bpmn:startEvent"
        },
        "id": "Process_gywbry",
        "userTask": {
            "outgoing": "SequenceFlow_19fdkug",
            "incoming": "SequenceFlow_27tbgs",
            "businessProp": {
                "email-type": "text/html",
                "assignee-role": {
                    "roleMeta": "",
                    "roleName": "solicitanteROLE",
                    "actualData": "{\"name\":\"solicitanteROLE.role\",\"type\":14,\"parentName\":\"App Roles\",\"location\":\"/HPP/App Roles\",\"properties\":{},\"meta\":null,\"size\":0,\"errorMessage\":null,\"parentId\":null,\"projectId\":\"21efb2e9-d872-47bc-9b32-7702008aae8b\",\"referenceId\":\"b0d2383b-3334-457f-9ea9-bf6be998d603\",\"namespaceId\":null,\"content\":null,\"id\":\"3cd330ee-b13c-4d62-babd-2d6401e572b4\",\"createdOn\":\"2021-06-22T08:06:36.411-03:00\",\"modifiedOn\":\"2021-06-22T08:06:36.411-03:00\",\"modifiedBy\":null,\"createdBy\":null,\"rolePack\":null,\"buildProgress\":false,\"contentAsBytes\":null,\"contentAsString\":\"\"}"
                },
                "attribute-references": [],
                "email-body": "Revise%20o%20contrato%20cont_contrato_id,%0D%0A%0D%0ASetor%20cont_setor%0D%0AEmpresa%20contratada%20cont_contratada%0D%0AEmpresa%20contratante%20cont_contratante%0D%0AObjetivo%20do%20contrato%20cont_objetivo%0D%0APedido%20por%20cont_responsavel%0D%0AStatus%20cont_status%0D%0ATempo%20Total%20od%20processo:%20proc_total_duration%0D%0A",
                "fromUser": "cfg.username",
                "form-variables": [],
                "subject": "contrato cont.contrato_id setor cont.setor",
                "body-replace-strings": [],
                "notify-type": "Message Only",
                "assignee-type": "Role"
            },
            "name": "A Solicitante",
            "id": "UserTask_14in0bl",
            "type": "bpmn:userTask",
            "events": []
        }
    },
    "BPMNDiagram": {
        "bpmnElement": "Process_gywbry",
        "BPMNPlane": {
            "BPMNShape": [
                {
                    "bpmnElement": "StartEvent_1vil7bl",
                    "Bounds": {
                        "cx": 219,
                        "cy": 227.5,
                        "x": 201,
                        "width": 36,
                        "y": 198,
                        "height": 59
                    },
                    "id": "StartEvent_1vil7bl_ve"
                },
                {
                    "bpmnElement": "ExclusiveGateway_ii7wwz",
                    "Bounds": {
                        "cx": 450.8203125,
                        "cy": 203,
                        "x": 427,
                        "width": 101.109375,
                        "y": 189.5,
                        "height": 73
                    },
                    "id": "ExclusiveGateway_ii7wwz_ve"
                },
                {
                    "bpmnElement": "EndEvent_1p7gkga",
                    "Bounds": {
                        "cx": 954,
                        "cy": 226,
                        "x": 936,
                        "width": 36,
                        "y": 196.5,
                        "height": 59
                    },
                    "id": "EndEvent_1p7gkga_ve"
                },
                {
                    "bpmnElement": "EndEvent_spet5s",
                    "Bounds": {
                        "cx": 452,
                        "cy": 368.5,
                        "x": 434,
                        "width": 36,
                        "y": 339,
                        "height": 59
                    },
                    "id": "EndEvent_spet5s_ve"
                },
                {
                    "bpmnElement": "UserTask_14in0bl",
                    "Bounds": {
                        "cx": 718,
                        "cy": 214.50000762939453,
                        "x": 641.0199966430664,
                        "width": 153.9600067138672,
                        "y": 176.3350067138672,
                        "height": 76.33000183105469
                    },
                    "id": "UserTask_14in0bl_ve"
                }
            ],
            "BPMNEdge": [
                {
                    "waypoint": [
                        {
                            "x": "237",
                            "y": "216"
                        },
                        {
                            "x": "332",
                            "y": "216"
                        },
                        {
                            "x": "332",
                            "y": "214.5"
                        },
                        {
                            "x": "427",
                            "y": "214.5"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_1a7nlbo",
                    "id": "SequenceFlow_1a7nlbo_ve"
                },
                {
                    "waypoint": [
                        {
                            "x": "477",
                            "y": "214.5"
                        },
                        {
                            "x": "559.0099983215332",
                            "y": "214.5"
                        },
                        {
                            "x": "559.0099983215332",
                            "y": "214.49999908447265"
                        },
                        {
                            "x": "641.0199966430664",
                            "y": "214.49999908447265"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_27tbgs",
                    "id": "SequenceFlow_27tbgs_ve",
                    "BPMNLabel": {"Bounds": {
                        "cx": 583.0390625,
                        "cy": 191,
                        "x": 539,
                        "width": 88.078125,
                        "y": 179,
                        "height": 24
                    }}
                },
                {
                    "waypoint": [
                        {
                            "x": "794.98001953125",
                            "y": "214.50000671386718"
                        },
                        {
                            "x": "936",
                            "y": "214.5"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_19fdkug",
                    "id": "SequenceFlow_19fdkug_ve"
                },
                {
                    "waypoint": [
                        {
                            "x": "452",
                            "y": "239.5"
                        },
                        {
                            "x": "452",
                            "y": "339"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_xojf30",
                    "id": "SequenceFlow_xojf30_ve",
                    "BPMNLabel": {"Bounds": {
                        "cx": 472,
                        "cy": 266,
                        "x": 432,
                        "width": 80,
                        "y": 254,
                        "height": 24
                    }}
                }
            ]
        },
        "id": "Process_gywbry_ve"
    },
    "collaboration": {}
}