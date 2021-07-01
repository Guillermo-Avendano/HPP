{
    "process": {
        "sequenceFlow": [
            {
                "targetRef": "UserTask_oshb1v",
                "businessProp": {"condition": "target == \"SOLICITANTE\""},
                "name": "SOLICITANTE",
                "id": "SequenceFlow_cix4z",
                "sourceRef": "ExclusiveGateway_18hwx8j",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "EndEvent_q1jem2",
                "businessProp": {},
                "name": "",
                "id": "SequenceFlow_1b2uerj",
                "sourceRef": "UserTask_oshb1v",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "ExclusiveGateway_q5qnaf",
                "businessProp": {"condition": "target != \"SOLICITANTE\""},
                "name": "NO",
                "id": "SequenceFlow_22dbq7",
                "sourceRef": "ExclusiveGateway_18hwx8j",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "UserTask_10hke6s",
                "businessProp": {"condition": "target == \"CONTRATOS\""},
                "name": "CONTRATOS",
                "id": "SequenceFlow_1qq4v6c",
                "sourceRef": "ExclusiveGateway_q5qnaf",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "UserTask_3ewfp7",
                "businessProp": {"condition": "target != \"CONTRATOS\""},
                "name": "JURIDICO",
                "id": "SequenceFlow_1rxeoyt",
                "sourceRef": "ExclusiveGateway_q5qnaf",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "EndEvent_1rwwmge",
                "businessProp": {},
                "name": "",
                "id": "SequenceFlow_69w8uz",
                "sourceRef": "UserTask_3ewfp7",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "EndEvent_1w1jlwk",
                "businessProp": {},
                "name": "",
                "id": "SequenceFlow_1g0xfm0",
                "sourceRef": "UserTask_10hke6s",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "ExclusiveGateway_18hwx8j",
                "businessProp": {},
                "name": "",
                "id": "SequenceFlow_14huk2d",
                "sourceRef": "StartEvent_ep9qfu",
                "type": "bpmn:sequenceFlow"
            }
        ],
        "endEvent": [
            {
                "incoming": "SequenceFlow_1b2uerj",
                "businessProp": {},
                "name": "End",
                "id": "EndEvent_q1jem2",
                "type": "bpmn:endEvent"
            },
            {
                "incoming": "SequenceFlow_69w8uz",
                "businessProp": {},
                "name": "End",
                "id": "EndEvent_1rwwmge",
                "type": "bpmn:endEvent"
            },
            {
                "incoming": "SequenceFlow_1g0xfm0",
                "businessProp": {},
                "name": "End",
                "id": "EndEvent_1w1jlwk",
                "type": "bpmn:endEvent"
            }
        ],
        "exclusiveGateway": [
            {
                "outgoing": [
                    "SequenceFlow_cix4z",
                    "SequenceFlow_22dbq7"
                ],
                "incoming": "SequenceFlow_14huk2d",
                "businessProp": {},
                "name": "VerificaSolicitante",
                "id": "ExclusiveGateway_18hwx8j",
                "type": "bpmn:exclusiveGateway"
            },
            {
                "outgoing": [
                    "SequenceFlow_1qq4v6c",
                    "SequenceFlow_1rxeoyt"
                ],
                "incoming": "SequenceFlow_22dbq7",
                "businessProp": {},
                "name": "VerificaContratos",
                "id": "ExclusiveGateway_q5qnaf",
                "type": "bpmn:exclusiveGateway"
            }
        ],
        "textAnnotation": {
            "incoming": "Association_cmtmyp",
            "businessProp": {},
            "name": "",
            "id": "TextAnnotation_1vkphhm",
            "text": "Inicio de Proceso",
            "type": "bpmn:textAnnotation"
        },
        "startEvent": {
            "outgoing": [
                "Association_cmtmyp",
                "SequenceFlow_14huk2d"
            ],
            "businessProp": {
                "defaultPriority": "Low",
                "due-date": false,
                "due-date-type": "Custom",
                "priority": false,
                "start-payload-variables": [
                    {
                        "ref": "cont",
                        "regex": "",
                        "type": "",
                        "mandatory": true,
                        "errormsg": ""
                    },
                    {
                        "ref": "proc",
                        "regex": "",
                        "type": "",
                        "mandatory": true,
                        "errormsg": ""
                    },
                    {
                        "ref": "cfg",
                        "regex": "",
                        "type": "",
                        "mandatory": true,
                        "errormsg": ""
                    },
                    {
                        "ref": "target",
                        "regex": "",
                        "type": "",
                        "mandatory": true,
                        "errormsg": ""
                    }
                ]
            },
            "name": "Start",
            "id": "StartEvent_ep9qfu",
            "type": "bpmn:startEvent"
        },
        "association": {
            "targetRef": "TextAnnotation_1vkphhm",
            "id": "Association_cmtmyp",
            "sourceRef": "StartEvent_ep9qfu",
            "type": "bpmn:association"
        },
        "id": "Process_brai0f",
        "userTask": [
            {
                "outgoing": "SequenceFlow_1b2uerj",
                "incoming": "SequenceFlow_cix4z",
                "businessProp": {
                    "email-type": "text/html",
                    "assignee-role": {
                        "roleMeta": "",
                        "roleName": "solicitanteROLE",
                        "actualData": "{\"name\":\"solicitanteROLE.role\",\"type\":14,\"parentName\":\"App Roles\",\"location\":\"/HPP/App Roles\",\"properties\":{},\"meta\":null,\"size\":0,\"errorMessage\":null,\"parentId\":null,\"projectId\":\"21efb2e9-d872-47bc-9b32-7702008aae8b\",\"referenceId\":\"b0d2383b-3334-457f-9ea9-bf6be998d603\",\"namespaceId\":null,\"content\":null,\"id\":\"3cd330ee-b13c-4d62-babd-2d6401e572b4\",\"createdOn\":\"2021-06-22T08:06:36.411-03:00\",\"modifiedOn\":\"2021-06-22T08:06:36.411-03:00\",\"modifiedBy\":null,\"createdBy\":null,\"rolePack\":null,\"buildProgress\":false,\"contentAsBytes\":null,\"contentAsString\":\"\"}"
                    },
                    "attribute-references": [],
                    "email-body": "A%20ver",
                    "fromUser": "cfg.username",
                    "form-variables": [],
                    "subject": "\"Contrato \" +  cont.contrato_id + \" de \" + cont.setor + \"/\" + cont.responsavel",
                    "body-replace-strings": [],
                    "notify-type": "Message Only",
                    "assignee-type": "Role"
                },
                "name": "A Solicitante",
                "id": "UserTask_oshb1v",
                "type": "bpmn:userTask",
                "events": []
            },
            {
                "outgoing": "SequenceFlow_1g0xfm0",
                "incoming": "SequenceFlow_1qq4v6c",
                "businessProp": {
                    "email-type": "text/html",
                    "assignee-role": {
                        "roleMeta": "",
                        "roleName": "contratosROLE",
                        "actualData": "{\"name\":\"contratosROLE.role\",\"type\":14,\"parentName\":\"App Roles\",\"location\":\"/HPP/App Roles\",\"properties\":{},\"meta\":null,\"size\":0,\"errorMessage\":null,\"parentId\":null,\"projectId\":\"21efb2e9-d872-47bc-9b32-7702008aae8b\",\"referenceId\":\"70d5f7ce-761f-4f52-90a7-5991fb58a509\",\"namespaceId\":null,\"content\":null,\"id\":\"3d50ddb7-11e2-4496-abaa-7cb0f0f9e4bc\",\"createdOn\":\"2021-06-22T08:06:49.641-03:00\",\"modifiedOn\":\"2021-06-22T08:06:49.641-03:00\",\"modifiedBy\":null,\"createdBy\":null,\"rolePack\":null,\"buildProgress\":false,\"contentAsBytes\":null,\"contentAsString\":\"\"}"
                    },
                    "attribute-references": [],
                    "email-body": "Empresa%20contratada:%20cont_contratada%0D%0AEmpresa%20contratante:%20cont_contratante%0D%0AObjetivo%20do%20contrato:%20cont_objetivo%0D%0AStatus:%20proc_status%0D%0ATempo%20total%20do%20processo:%20proc_total_duration",
                    "fromUser": "cfg.username",
                    "form-variables": [],
                    "subject": "\"Contrato \" +  cont.contrato_id + \" de \" + cont.setor + \"/\" + cont.responsavel",
                    "body-replace-strings": [
                        {
                            "string": "cont_contratada",
                            "value": "cont.contratada"
                        },
                        {
                            "string": "cont_contratatante",
                            "value": "cont.contratante"
                        },
                        {
                            "string": "cont_objetivo",
                            "value": "cont.objetivo"
                        },
                        {
                            "string": "proc_status",
                            "value": "proc.status"
                        },
                        {
                            "string": "proc_total_duration",
                            "value": "proc.total_duration"
                        }
                    ],
                    "notify-type": "Message Only",
                    "assignee-type": "Role"
                },
                "name": "A contratos",
                "id": "UserTask_10hke6s",
                "type": "bpmn:userTask",
                "events": []
            },
            {
                "outgoing": "SequenceFlow_69w8uz",
                "incoming": "SequenceFlow_1rxeoyt",
                "businessProp": {
                    "email-type": "text/html",
                    "assignee-role": {
                        "roleMeta": "",
                        "roleName": "juridicoROLE",
                        "actualData": "{\"name\":\"juridicoROLE.role\",\"type\":14,\"parentName\":\"App Roles\",\"location\":\"/HPP/App Roles\",\"properties\":{},\"meta\":null,\"size\":0,\"errorMessage\":null,\"parentId\":null,\"projectId\":\"21efb2e9-d872-47bc-9b32-7702008aae8b\",\"referenceId\":\"9513cb7c-8d89-4e0e-ad40-1d0d2a8e4806\",\"namespaceId\":null,\"content\":null,\"id\":\"2e9ae59b-cf47-443a-b66b-2600f7a2c138\",\"createdOn\":\"2021-06-22T08:07:04.895-03:00\",\"modifiedOn\":\"2021-06-22T08:07:04.895-03:00\",\"modifiedBy\":null,\"createdBy\":null,\"rolePack\":null,\"buildProgress\":false,\"contentAsBytes\":null,\"contentAsString\":\"\"}"
                    },
                    "attribute-references": [],
                    "email-body": "Empresa%20contratada:%20cont_contratada%0D%0AEmpresa%20contratante:%20cont_contratante%0D%0AObjetivo%20do%20contrato:%20cont_objetivo%0D%0AStatus:%20proc_status%0D%0ATempo%20total%20do%20processo:%20proc_total_duration",
                    "fromUser": "cfg.username",
                    "form-variables": [],
                    "subject": "\"Contrato \" +  cont.contrato_id + \" de \" + cont.setor + \"/\" + cont.responsavel",
                    "body-replace-strings": [
                        {
                            "string": "cont_contratada",
                            "value": "cont.contratada"
                        },
                        {
                            "string": "cont_contratante",
                            "value": "cont.contratante"
                        },
                        {
                            "string": "cont_objetivo",
                            "value": "cont.objetivo"
                        },
                        {
                            "string": "proc_status",
                            "value": "proc.status"
                        },
                        {
                            "string": "proc_total_duration",
                            "value": "proc.total_duration"
                        }
                    ],
                    "notify-type": "Message Only",
                    "assignee-type": "Role"
                },
                "name": "A Juridico",
                "id": "UserTask_3ewfp7",
                "type": "bpmn:userTask",
                "events": []
            }
        ]
    },
    "BPMNDiagram": {
        "bpmnElement": "Process_brai0f",
        "BPMNPlane": {
            "BPMNShape": [
                {
                    "bpmnElement": "EndEvent_q1jem2",
                    "Bounds": {
                        "cx": 908,
                        "cy": 191,
                        "x": 890,
                        "width": 36,
                        "y": 161.5,
                        "height": 59
                    },
                    "id": "EndEvent_q1jem2_ve"
                },
                {
                    "bpmnElement": "EndEvent_1rwwmge",
                    "Bounds": {
                        "cx": 688,
                        "cy": 572.5,
                        "x": 670,
                        "width": 36,
                        "y": 543,
                        "height": 59
                    },
                    "id": "EndEvent_1rwwmge_ve"
                },
                {
                    "bpmnElement": "EndEvent_1w1jlwk",
                    "Bounds": {
                        "cx": 891,
                        "cy": 397.5,
                        "x": 873,
                        "width": 36,
                        "y": 368,
                        "height": 59
                    },
                    "id": "EndEvent_1w1jlwk_ve"
                },
                {
                    "bpmnElement": "ExclusiveGateway_18hwx8j",
                    "Bounds": {
                        "cx": 355.8203125,
                        "cy": 167,
                        "x": 332,
                        "width": 98.140625,
                        "y": 153.5,
                        "height": 73
                    },
                    "id": "ExclusiveGateway_18hwx8j_ve"
                },
                {
                    "bpmnElement": "ExclusiveGateway_q5qnaf",
                    "Bounds": {
                        "cx": 355.5,
                        "cy": 374.5,
                        "x": 332,
                        "width": 93.5625,
                        "y": 361,
                        "height": 73
                    },
                    "id": "ExclusiveGateway_q5qnaf_ve"
                },
                {
                    "bpmnElement": "TextAnnotation_1vkphhm",
                    "Bounds": {
                        "cx": 84,
                        "cy": 93.6953125,
                        "x": 34,
                        "width": 100,
                        "y": 76,
                        "height": 36.609375
                    },
                    "id": "TextAnnotation_1vkphhm_ve"
                },
                {
                    "bpmnElement": "StartEvent_ep9qfu",
                    "Bounds": {
                        "cx": 84,
                        "cy": 191,
                        "x": 66,
                        "width": 36,
                        "y": 161.5,
                        "height": 59
                    },
                    "id": "StartEvent_ep9qfu_ve"
                },
                {
                    "bpmnElement": "UserTask_oshb1v",
                    "Bounds": {
                        "cx": 649,
                        "cy": 178.50000762939453,
                        "x": 572.0199966430664,
                        "width": 153.9600067138672,
                        "y": 140.3350067138672,
                        "height": 76.33000183105469
                    },
                    "id": "UserTask_oshb1v_ve"
                },
                {
                    "bpmnElement": "UserTask_10hke6s",
                    "Bounds": {
                        "cx": 649,
                        "cy": 385.99999237060547,
                        "x": 572.0199966430664,
                        "width": 153.9600067138672,
                        "y": 347.8349914550781,
                        "height": 76.33000183105469
                    },
                    "id": "UserTask_10hke6s_ve"
                },
                {
                    "bpmnElement": "UserTask_3ewfp7",
                    "Bounds": {
                        "cx": 357,
                        "cy": 561.0000228881836,
                        "x": 280.0199966430664,
                        "width": 153.9600067138672,
                        "y": 522.8350219726562,
                        "height": 76.33000183105469
                    },
                    "id": "UserTask_3ewfp7_ve"
                }
            ],
            "BPMNEdge": [
                {
                    "waypoint": [
                        {
                            "x": "382",
                            "y": "178.5"
                        },
                        {
                            "x": "572.0199966430664",
                            "y": "178.50000671386718"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_cix4z",
                    "id": "SequenceFlow_cix4z_ve",
                    "BPMNLabel": {"Bounds": {
                        "cx": 501,
                        "cy": 155,
                        "x": 456.9609375,
                        "width": 88.078125,
                        "y": 143,
                        "height": 24
                    }}
                },
                {
                    "waypoint": [
                        {
                            "x": "725.9799966430664",
                            "y": "178.50000671386718"
                        },
                        {
                            "x": "807.9899983215332",
                            "y": "178.50000671386718"
                        },
                        {
                            "x": "807.9899983215332",
                            "y": "179.5"
                        },
                        {
                            "x": "890",
                            "y": "179.5"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_1b2uerj",
                    "id": "SequenceFlow_1b2uerj_ve"
                },
                {
                    "waypoint": [
                        {
                            "x": "357",
                            "y": "203.5"
                        },
                        {
                            "x": "357",
                            "y": "361"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_22dbq7",
                    "id": "SequenceFlow_22dbq7_ve",
                    "BPMNLabel": {"Bounds": {
                        "cx": 377,
                        "cy": 259,
                        "x": 337,
                        "width": 80,
                        "y": 247,
                        "height": 24
                    }}
                },
                {
                    "waypoint": [
                        {
                            "x": "382",
                            "y": "386"
                        },
                        {
                            "x": "572.0199966430664",
                            "y": "385.99999145507815"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_1qq4v6c",
                    "id": "SequenceFlow_1qq4v6c_ve",
                    "BPMNLabel": {"Bounds": {
                        "cx": 478.71875,
                        "cy": 363,
                        "x": 437,
                        "width": 83.4375,
                        "y": 351,
                        "height": 24
                    }}
                },
                {
                    "waypoint": [
                        {
                            "x": "357",
                            "y": "411"
                        },
                        {
                            "x": "356.9999966430664",
                            "y": "522.8350219726562"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_1rxeoyt",
                    "id": "SequenceFlow_1rxeoyt_ve",
                    "BPMNLabel": {"Bounds": {
                        "cx": 377,
                        "cy": 444,
                        "x": 337,
                        "width": 80,
                        "y": 432,
                        "height": 24
                    }}
                },
                {
                    "waypoint": [
                        {
                            "x": "433.97999664306644",
                            "y": "561.0000219726562"
                        },
                        {
                            "x": "670",
                            "y": "561"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_69w8uz",
                    "id": "SequenceFlow_69w8uz_ve"
                },
                {
                    "waypoint": [
                        {
                            "x": "725.9799966430664",
                            "y": "385.99999145507815"
                        },
                        {
                            "x": "873",
                            "y": "386"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_1g0xfm0",
                    "id": "SequenceFlow_1g0xfm0_ve"
                },
                {
                    "waypoint": [
                        {
                            "x": "102",
                            "y": "179.5"
                        },
                        {
                            "x": "217",
                            "y": "179.5"
                        },
                        {
                            "x": "217",
                            "y": "178.5"
                        },
                        {
                            "x": "332",
                            "y": "178.5"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_14huk2d",
                    "id": "SequenceFlow_14huk2d_ve"
                },
                {
                    "waypoint": [
                        {
                            "x": "84",
                            "y": "161.5"
                        },
                        {
                            "x": "84",
                            "y": "112"
                        }
                    ],
                    "bpmnElement": "Association_cmtmyp",
                    "id": "Association_cmtmyp_ve"
                }
            ]
        },
        "id": "Process_brai0f_ve"
    },
    "collaboration": {}
}